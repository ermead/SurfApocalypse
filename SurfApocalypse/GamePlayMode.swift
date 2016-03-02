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

@available(OSX 10.11, *)
class GamePlayMode: SGScene, SKPhysicsContactDelegate {
    
    //MARK: Instance Variables
    
    var characterIndex = 0
    var levelIndex = 0
    
    var canThrow: Bool = false
    
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
       // let physicsSystem = GKComponentSystem(componentClass: PhysicsComponent.self)
        //let scrollerSystem = GKComponentSystem(componentClass: ChaseScrollComponent.self)
        //return [parallaxSystem, animationSystem, scrollerSystem]
        return [parallaxSystem, animationSystem]
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
    }
    
    //MARK: Functions
    
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
    
   
    //MARK: Life Cycle
    
    override func update(currentTime: NSTimeInterval) {
        
        if !pauseLoop {
        var deltaTime = currentTime - lastUpdateTimeInterval
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
        lastUpdateTimeInterval = currentTime
        
        //Update Components
        
        for componentSystem in componentSystems {
            componentSystem .updateWithDeltaTime(deltaTime)
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
                let nextScene = MainMenu(size: self.scene!.size)
                nextScene.scaleMode = self.scaleMode
                self.view?.presentScene(nextScene)
            }
            
        }
        
        
        
        if canThrow == true {
        ///THROW & JUMP:
        if let player = worldLayer.childNodeWithName("playerNode") as? EntityNode {
        if (location.x > player.position.x){
            // on right side
            control.jumpPressed = true
            print("jump")
        } else {
            // on left side
            control.throwPressed = true
            print("throw")
            }
        }
        ///
        } else {
            //Only Jump
          control.jumpPressed = true
        }
        
        
    }
    
    override func screenInteractionMoved(location: CGPoint) {
        
        control.jumpPressed = false
        control.throwPressed = false

    }
    
    override func screenInteractionEnded(location: CGPoint) {
        control.jumpPressed = false
        control.throwPressed = false
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
        nodeA.contactWith(nodeB)
    }
    
    //MARK: Camera Settings:
    
    
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
