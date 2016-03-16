//
//  GamePlayMode.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit



var randomTreasures = ["diamond", "gumdrop", "gem"]

@available(OSX 10.11, *)
class GamePlayMode: SGScene, SKPhysicsContactDelegate {
    
    //JoyStick and Buttons
    var joystickControl: Bool = true
    let button1 = SKSpriteNode(imageNamed: "Button")
    let button2 = SKSpriteNode(imageNamed: "Button")
    let base = SKSpriteNode(imageNamed: "Base")
    let ball = SKSpriteNode(imageNamed: "Ball")
    
    var stickActive: Bool = false
    
    //random treasures:
    let randomTreasure = GKRandomDistribution(forDieWithSideCount: randomTreasures.count)
    let randomNumberOfItems = GKRandomDistribution(forDieWithSideCount: 6)
    
    //MARK: Instance Variables
    
    var characterIndex = 0
    var levelIndex = 0
    
    var canThrow: Bool = true
    
    //Generators
    
    //Level Data
    var gemsCollected = 0
    var diamondsCollected = 0
    var gumdropsCollected = 0
    var worldFrame = CGRect()
    
    //Layers
    
    var worldLayer: TileLayer!
    var backgroundLayer: SKNode!
    var overlayGUI: SKNode!
    var projectileLayer: SKNode!
    
    //GUI
    let gemsLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
    let diamondsLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
    let gumdropsLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
    
    //States
    
    lazy var stateMachine: GKStateMachine = GKStateMachine(states: [
        GameSceneInitialState(scene: self),
        GameSceneActiveState(scene: self),
        GameScenePausedState(scene: self),
        GameSceneVictorySeqState(scene: self),
        GameSceneWinState(scene: self),
        GameSceneLoseState(scene: self)
        ])
    
    //ECS
    
    var entities = Set<GKEntity>()
    
    //Component Systems
    
    lazy var componentSystems: [GKComponentSystem] = {
        let parallaxSystem = GKComponentSystem(componentClass: ParallaxComponent.self)
        let animationSystem = GKComponentSystem(componentClass: AnimationComponent.self)
        let enemyMotionSystem = GKComponentSystem(componentClass: EnemyMotionComponent.self)
       // let physicsSystem = GKComponentSystem(componentClass: PhysicsComponent.self)
        //let scrollerSystem = GKComponentSystem(componentClass: ChaseScrollComponent.self)
        //return [parallaxSystem, animationSystem, scrollerSystem]
        return [parallaxSystem, animationSystem, enemyMotionSystem]
    }()
    
        let sideScrollSystem = SideScrollComponentSystem(componentClass: SideScrollComponent.self)
    
    
    //Timers
    
    var lastUpdateTimeInterval: NSTimeInterval = 0
    let maximumUpdateDeltaTime: NSTimeInterval = 1.0 / 60.0
    var lastDeltaTime: NSTimeInterval = 0
    
    //Controls
    
    var control = ControlScheme()
    var pauseLoop = false
    
    //Sounds
    
    let sndCollectGood = SKAction.playSoundFileNamed("collect_good.wav", waitForCompletion: false)
    let sndJump = SKAction.playSoundFileNamed("jump.wav", waitForCompletion: false)
    let sndThrow = SKAction.playSoundFileNamed("throw.wav", waitForCompletion: false)
    
    //MARK: Initializer
    
    override func didMoveToView(view: SKView) {
      
        stateMachine.enterState(GameSceneInitialState.self)
        
        gemsLabel.posByScreen(0.35, y: 0.35)
        gemsLabel.fontSize = 25
        gemsLabel.text = lt("gems: \(gemsCollected)")
        gemsLabel.fontColor = SKColor.whiteColor()
        gemsLabel.zPosition = 150
        overlayGUI.addChild(gemsLabel)
        
        gumdropsLabel.posByScreen(0.35, y: 0.30)
        gumdropsLabel.fontSize = 25
        gumdropsLabel.text = lt("gumdrops: \(gumdropsCollected)")
        gumdropsLabel.fontColor = SKColor.whiteColor()
        gumdropsLabel.zPosition = 150
        overlayGUI.addChild(gumdropsLabel)
        
        diamondsLabel.posByScreen(0.35, y: 0.25)
        diamondsLabel.fontSize = 25
        diamondsLabel.text = lt("diamonds: \(diamondsCollected)")
        diamondsLabel.fontColor = SKColor.whiteColor()
        diamondsLabel.zPosition = 150
        overlayGUI.addChild(diamondsLabel)
        
        if joystickControl == true {
        addJoystickControls()
        }
    }
    
    //MARK: Functions
    
    func addJoystickControls(){
        
        overlayGUI.addChild(ball)
        overlayGUI.addChild(base)
        base.posByScreen(-0.35, y: -0.35)
        ball.position = base.position
        ball.zPosition = 152
        base.zPosition = 151
        base.alpha = 0.4
        ball.alpha = 0.4
        ball.name = "joystick"
        
        overlayGUI.addChild(button1)
        button1.posByScreen(0.25, y: -0.35)
        button1.zPosition = 151
        button1.alpha = 0.2
        button1.xScale = 0.75
        button1.yScale = button1.xScale
        button1.name = "button1"
        
        overlayGUI.addChild(button2)
        button2.posByScreen(0.40, y: -0.35)
        button2.zPosition = 151
        button2.alpha = 0.2
        button2.xScale = button1.xScale
        button2.yScale = button1.xScale
        button2.name = "button2"
        
    }
    
    func addEntity(entity: GKEntity,toLayer layer:SKNode) {
        //Add Entity to set
        entities.insert(entity)
        
        //Add Sprites to Scene
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            layer.addChild(spriteNode)
        }
        
        //Add Components to System
        for componentSystem in self.componentSystems {
            componentSystem.addComponentWithEntity(entity)
        }
        
        sideScrollSystem.addComponentWithEntity(entity)
        
        
    }
    
    func getRandomTreasureEntityAndSpawnIn(location: CGPoint){
        let randomInt = randomTreasure.nextInt()
        let entityName = randomTreasures[randomInt - 1]
        print("random")
        let adjustedInt = CGFloat((CGFloat(randomInt) * 36) - 72)
        let randomLocation = CGPoint(x: location.x + adjustedInt, y: location.y + 20)
        
        switch entityName {
        case "diamond" :
            print("diamond")
            let diamond = GemEntity(position: randomLocation, size: CGSize(width: 32, height: 32), texture: SKTextureAtlas(named: "Tiles").textureNamed("diamond"), item: "diamond")
            diamond.spriteComponent.node.zPosition = 150
            self.addEntity(diamond, toLayer: worldLayer)
            break
        case "gumdrop" :
            print("gumdrop")
            let gd = GemEntity(position: randomLocation, size: CGSize(width: 32, height: 32), texture: SKTextureAtlas(named: "Tiles").textureNamed("gumdrop"), item: "gumdrop")
            gd.spriteComponent.node.zPosition = 150
            self.addEntity(gd, toLayer: worldLayer)
            break
        case "gem" :
            print("gem")
            let gem = GemEntity(position: randomLocation, size: CGSize(width: 32, height: 32), texture: SKTextureAtlas(named: "Tiles").textureNamed("gem"), item: "gem")
            gem.spriteComponent.node.zPosition = 150
            self.addEntity(gem, toLayer: worldLayer)
            break
        default : break
        }
    }
    
   
    //MARK: Life Cycle
    
    override func update(currentTime: NSTimeInterval) {
        
        if !pauseLoop {
        
        var deltaTime = currentTime - lastUpdateTimeInterval
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
        lastUpdateTimeInterval = currentTime
        
        //Update Components
        
        for componentSystem in componentSystems {
            componentSystem.updateWithDeltaTime(deltaTime)
        }
            
        sideScrollSystem.updateWithDeltaTime(deltaTime, controlInput: control)
                
         //Update Game
            
         gemsLabel.text = lt("gems: \(gemsCollected)")
         gumdropsLabel.text = lt("gumdrops: \(gumdropsCollected)")
         diamondsLabel.text = lt("diamonds: \(diamondsCollected)")
            
        }
        
    }
    
    //MARK: Responders:
    
    override func screenInteractionStarted(location: CGPoint) {
        
        print("loctaion of touch is: \(location)")
        
        
        if let node = nodeAtPoint(location) as? SKNode {
            
            if node.name == "joystick" {
                print("joystick")
                stickActive = true
            } else if node.name == "button1" {
                print("button1")
                //stickActive = false
                control.jumpPressed = true
            } else if node.name == "button2" {
                print("button2")
                //stickActive = false
                if canThrow {
                    control.throwPressed = true
                }
            }
        }
        
        
        if let node = nodeAtPoint(location) as? SKLabelNode {
            
            if node.name == "PauseButton" {
                if pauseLoop {
                    stateMachine.enterState(GameSceneActiveState.self)
                } else {
                    stateMachine.enterState(GameScenePausedState.self)
                }
                return 
            }
            
            if node.name == "mainMenuButton" {
                //Transition to Main Menu
                print("Main button pressed")
                let nextScene = MainMenu(size: self.scene!.size)
                nextScene.scaleMode = self.scaleMode
                self.view?.presentScene(nextScene)
            }
           
        }
        
//        if canThrow == true {
//        ///THROW & JUMP:
//        if let player = worldLayer.childNodeWithName("playerNode") as? EntityNode {
//        if (location.x > player.position.x){
//            // on right side
//            control.jumpPressed = true
//            print("jump")
//        } else {
//            // on left side
//            control.throwPressed = true
//            print("throw")
//            }
//        }
//        ///
//        } else {
//            //Only Jump
//          control.jumpPressed = true
//        }
        
        
    }
    
    override func screenInteractionMoved(location: CGPoint) {
        
//        control.jumpPressed = false
//        control.throwPressed = false
        
        
        
        if stickActive == true {
            
            let pos = overlayGUI.convertPoint(location, fromNode: self)
            
            let v = CGVectorMake(pos.x - base.position.x, pos.y - base.position.y)
            let angle = atan2(v.dy, v.dx)
            //print(angle)
            
            var deg = angle * CGFloat(180 / M_PI)
            //print(deg + 180)
            
            
            let length: CGFloat = base.frame.size.height / 2
            
            let xDist: CGFloat = sin(angle - 1.57079633) * length
            let yDist: CGFloat = cos(angle - 1.57079633) * length
            
            if (CGRectContainsPoint(base.frame, pos)){
                ball.position = pos
            } else {
                ball.position = CGPointMake(base.position.x - xDist, base.position.y + yDist)
            }
            
            // setup speed
            
            let multiplier: CGFloat = 0.1
            
            control.playerSpeed = v.dx * multiplier
            
            //thePlayer.adjustXSpeedAndScale()
            
            // ends active stick check
        }
    }
    
    override func screenInteractionEnded(location: CGPoint) {
        control.jumpPressed = false
        control.throwPressed = false
        
        if stickActive == true {
            //thePlayer.stopWalk()
            control.playerSpeed = 0
            
        } else if stickActive == false {
            
            
        }
        
        resetJoystick()
    }
    
    func resetJoystick(){
        let move: SKAction = SKAction.moveTo(base.position, duration: 0.2)
        move.timingMode = .EaseOut
        ball.runAction(move)
    
    }
    
    override func buttonEvent(event: String, velocity: Float, pushedOn: Bool) {
        
    }
    
    override func stickEvent(event: String, point: CGPoint) {
        
    }
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .Select:
                control.jumpPressed = true
                break
            case .PlayPause:
                if pauseLoop {
                    stateMachine.enterState(GameSceneActiveState.self)
                } else {
                    stateMachine.enterState(GameScenePausedState.self)
                }
                break
            default:
                break
            }
        }
    }
    
    override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        control.jumpPressed = false
    }
    
    override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        control.jumpPressed = false
    }
    
    override func pressesChanged(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        control.jumpPressed = false
    }
    #endif
    
    //Physics Delegate
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        if let sg_entity = contact.bodyA.node {
            
            if sg_entity.name == "enemyNode" {
                
                let enemy = sg_entity
                if contact.bodyB.node?.name == "projectile" {
                   print("enemy hit projectile")
                    enemy.removeFromParent()
                }
                
                if contact.bodyB.node?.name == "playerNode" {
                    print("enemy hit player")
                }
                
            }
            
            
            if sg_entity.name == "treasureBoxNode" {
                let treasurebox = sg_entity
                if contact.bodyB.node?.name == "projectile" {
                    print("throwable collided with box!")
                    contact.bodyB.node?.removeFromParent()
                    let tb = TreasureBoxEntity(position: treasurebox.position, size: CGSize(width: 32, height: 32), texture: SKTextureAtlas(named: "Tiles").textureNamed("t_openedBox"), item: "opened box")
                    treasurebox.removeFromParent()
                    tb.spriteComponent.node.zPosition = 150
                    self.addEntity(tb, toLayer: worldLayer)
                    //tb.treasureBoxHitAndSpawn(self)
                    let random = randomNumberOfItems.nextInt()
                    for var i = 0; i <= random; i++ {
                        getRandomTreasureEntityAndSpawnIn(CGPoint(x: treasurebox.position.x + 10, y: treasurebox.position.y + 20))
                    }
              
                }
            }
            
            if sg_entity.name == "playerNode" {
                let player = sg_entity
                if contact.bodyB.node?.name == "projectile" {
                    print("player collided with throwable!")
                    gumdropsCollected++
                }
            }
            
            
            
        }
        
        if let sg_entity = contact.bodyB.node {
            
            if sg_entity.name == "enemyNode" {
             
                let enemy = sg_entity
                if contact.bodyA.node?.name == "projectile" {
                    print("enemy hit projectile")
                    enemy.removeFromParent()
                }
                
                if contact.bodyB.node?.name == "playerNode" {
                    print("enemy hit player")
                }
                
            }
            
            
            
            if sg_entity.name == "treasureBoxNode" {
                let treasurebox = sg_entity
                if contact.bodyA.node?.name == "projectile" {
                    print("throwable collided with box!")
                    contact.bodyA.node?.removeFromParent()
                    let tb = TreasureBoxEntity(position: treasurebox.position, size: CGSize(width: 32, height: 32), texture: SKTextureAtlas(named: "Tiles").textureNamed("t_openedBox"), item: "opened box")
                    
                    treasurebox.removeFromParent()
                    tb.spriteComponent.node.zPosition = 150
                    self.addEntity(tb, toLayer: worldLayer)
                    //tb.treasureBoxHitAndSpawn(self)
                    
                    let random = randomNumberOfItems.nextInt()
                    for var i = 0; i <= random; i++ {
                        getRandomTreasureEntityAndSpawnIn(CGPoint(x: treasurebox.position.x + 10, y: treasurebox.position.y + 20))
                    }
                }
            }
            
            if sg_entity.name == "playerNode" {
                let player = sg_entity
                if contact.bodyB.node?.name == "projectile" {
                    print("player collided with throwable!")
                    gumdropsCollected++
                }
            }
        }
        
        if let bodyA = contact.bodyA.node as? EntityNode,
            let bodyAent = bodyA.entity as? SGEntity,
            let bodyB = contact.bodyB.node as? EntityNode,
            let bodyBent = bodyB.entity as? SGEntity
        {
            contactBegan(bodyAent, nodeB: bodyBent)
            contactBegan(bodyBent, nodeB: bodyAent)
        }
        
    }
    
  
  
    
    func contactBegan(nodeA:SGEntity, nodeB:SGEntity) {
        nodeA.contactWith(nodeB, scene: self)
    }
    
    //MARK: Camera Settings:
    
    func zoomOut(scale: CGFloat, duration: Double, returnTo: Bool) {
        let previousCameraScale: CGFloat = 0.64
            camera?.runAction(SKAction.scaleTo(scale, duration: duration))
        if returnTo {
            let wait = SKAction.waitForDuration(duration + 1)
            camera?.runAction(SKAction.sequence([wait, SKAction.scaleTo(previousCameraScale, duration: duration)]))
        }
    }
    
    func zoomIn(scale: CGFloat) {
        camera?.setScale(scale)
    }
    
    
    func setCameraConstraints() {
        
        guard let camera = camera else { return }
        
        if let player = worldLayer.childNodeWithName("playerNode") as? EntityNode {
            
            let zeroRange = SKRange(constantValue: 0.0)
            let playerNode = player
            let playerLocationConstraint = SKConstraint.distance(zeroRange, toNode: playerNode)
            
            let scaledSize = CGSize(width: SKMViewSize!.width * camera.xScale, height: SKMViewSize!.height * camera.yScale)
            
            let boardContentRect = worldFrame
            
            let xInset = min((scaledSize.width / 2), boardContentRect.width / 2)
            let yInset = min((scaledSize.height / 2), boardContentRect.height / 2)
            
            let insetContentRect = boardContentRect.insetBy(dx: xInset, dy: yInset)
            
            let xRange = SKRange(lowerLimit: insetContentRect.minX, upperLimit: insetContentRect.maxX)
            let yRange = SKRange(lowerLimit: insetContentRect.minY, upperLimit: insetContentRect.maxY)
            
            let levelEdgeConstraint = SKConstraint.positionX(xRange, y: yRange)
            levelEdgeConstraint.referenceNode = worldLayer
            
            camera.constraints = [playerLocationConstraint, levelEdgeConstraint]
        }
    }
}
