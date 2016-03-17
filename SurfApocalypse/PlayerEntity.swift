//
//  PlayerEntity.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

@available(OSX 10.11, *)
class PlayerEntity: SGEntity {
    
    var spriteComponent: SpriteComponent!
    var animationComponent: AnimationComponent!
    var physicsComponent: PhysicsComponent!
    var scrollerComponent: SideScrollComponent!
    var gameScene:GamePlayMode!
    var throwDistance: CGFloat = 200
    var isThrowing = false
    var isJumping = false
    var touchingBox = false
    
    var timing = NSTimeInterval(1.0 / 20.0)
    let slowTiming = NSTimeInterval(1.0 / 10.0)
    
    init(position: CGPoint, size: CGSize, firstFrame:SKTexture, atlas: SKTextureAtlas, scene:GamePlayMode) {
        super.init()
        
        gameScene = scene
        
        //Initialize components
        spriteComponent = SpriteComponent(entity: self, texture: SKTexture(), size: size, position:position)
        addComponent(spriteComponent)
        animationComponent = AnimationComponent(node: spriteComponent.node, animations: loadAnimations(atlas), timing: timing)
        addComponent(animationComponent)
        physicsComponent = PhysicsComponent(entity: self, bodySize: CGSize(width: spriteComponent.node.size.width * 0.8, height: spriteComponent.node.size.height * 0.8), bodyShape: .squareOffset, rotation: false)
        physicsComponent.setCategoryBitmask(ColliderType.Player.rawValue, dynamic: true)
        physicsComponent.setPhysicsCollisions(ColliderType.Wall.rawValue)
        physicsComponent.setPhysicsContacts(ColliderType.Collectable.rawValue | ColliderType.EndLevel.rawValue | ColliderType.KillZone.rawValue | ColliderType.Projectile.rawValue | ColliderType.Destroyable.rawValue)
        addComponent(physicsComponent)
        
        scrollerComponent = SideScrollComponent(entity: self)
        addComponent(scrollerComponent)
        
        //Final setup of components
        spriteComponent.node.physicsBody = physicsComponent.physicsBody
        spriteComponent.node.name = "playerNode"
        name = "playerEntity"
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
        
        if !gameScene.worldFrame.contains(spriteComponent.node.position) {
            playerDied()
        }
        
    }
    
    func loadAnimations(textureAtlas:SKTextureAtlas) -> [AnimationState: Animation] {
        var animations = [AnimationState: Animation]()
        
        animations[.Walk] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.Run.rawValue,
            forAnimationState: .Walk, repeatTexturesForever: true, textureSize: CGSize(width: 40.1, height: 48.0), timing: slowTiming)
        
        animations[.Jump] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.Jump.rawValue,
            forAnimationState: .Jump, repeatTexturesForever: false, textureSize: CGSize(width: 40.1, height: 48.0), timing: timing)
        animations[.Run] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.Run.rawValue,
            forAnimationState: .Run, repeatTexturesForever: true, textureSize: CGSize(width: 37.93, height: 48.0), timing: timing)
        animations[.IdleThrow] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.IdleThrow.rawValue,
            forAnimationState: .IdleThrow, repeatTexturesForever: false, textureSize: CGSize(width: 40.1, height: 48.0), timing: timing)
        
        animations[.Idle] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.Idle.rawValue,
            forAnimationState: .Idle, repeatTexturesForever: true, textureSize: CGSize(width: 31.0, height: 48.0), timing: timing)
        
        return animations
    }
    
  
    override func contactWith(entity:SGEntity, scene: GamePlayMode) {
        
        if entity.name == "enemyEntity" {
            print("player hit enemy")
            if isJumping {
                if let entity = entity as? EnemyEntity {
                    entity.spriteComponent.node.removeFromParent()
                }
            } else {
                self.playerGetHitByEnemy()
            }
        }
        
        if entity.name == "finishEntity" {
            gameScene.stateMachine.enterState(GameSceneWinState.self)
        }
        
        if entity.name == "gemEntity" {
            if let spriteComponent = entity.componentForClass(SpriteComponent.self) {
                spriteComponent.node.removeFromParent()
                gameScene.runAction(gameScene.sndCollectGood)
                if let gem = entity as? GemEntity{
                    if isThrowing == false {
                        if gem.item == "gem" {
                            gameScene.gemsCollected++
                        } else if gem.item == "gumdrop" {
                            print("gumdrop collected")
                            gameScene.gumdropsCollected++
                        } else if gem.item == "diamond" {
                            print("diamond collected")
                            gameScene.diamondsCollected++
                        }
                    }
                }
            }
            
        }
        
        if entity.name == "treasureBoxEntity" {
            
            if let box = entity as? TreasureBoxEntity {
                
                touchingBox = true
            
                if box.item == "opened box" {
                    return
                } else {
                    box.treasureBoxHitAndSpawn(self.gameScene)
                }
            }
            
        } else {
            touchingBox = false
        }
        
        if entity.name == "killZoneEntity" {
            playerDied()
        }
        
        if entity.name == "speedDashEntity" {
            
            if let entity = entity as? SpeedDashEntity {
                if entity.item == "speedDash" {
                    playerSpeedDash()
                } else if entity.item == "bounce" {
                    playerBounce()
                }
            }
            
        }
        
    }
    
    //////////
    
    
    func playerSpeedDash() {
        print("player speed dashing!")
        self.spriteComponent.node.physicsBody?.applyImpulse(CGVectorMake(10.0, 0))
        gameScene.zoomOut(0.75, duration: 0.5, returnTo: true)
        throwDistance = 400

    }
    
    func playerBounce() {
        print("player bounced!")
        self.spriteComponent.node.physicsBody?.applyImpulse(CGVectorMake(0, 10.0))
        gameScene.zoomOut(0.75, duration: 0.5, returnTo: true)
    }
    
    func playerGetHitByEnemy(){
        self.spriteComponent.node.physicsBody?.applyImpulse(CGVectorMake(-10, 10))
    }
    
    
   
    
    func playerDied() {
        gameScene.stateMachine.enterState(GameSceneLoseState.self)
    }
    
    func taperThrow(){
        if throwDistance > 200 {
            throwDistance = throwDistance * 0.8
        } else {
            throwDistance = 200
        }
    }
    
    func throwObject(){
        if let spriteComponent = self.spriteComponent {
            
            if self.spriteComponent.node.xScale == -1 {
                throwDistance = -throwDistance
            } 
            
        let object = SKSpriteNode()
        var physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 32, height: 32))
        physicsBody.dynamic = true
        physicsBody.categoryBitMask = ColliderType.Projectile.rawValue  
        physicsBody.contactTestBitMask = (ColliderType.Destroyable.rawValue | ColliderType.Player.rawValue)
        object.physicsBody = physicsBody
        object.position = CGPoint(x: spriteComponent.node.position.x + 10, y:  spriteComponent.node.position.y + 20)
        object.size = CGSize(width: 24, height: 24)
        object.zPosition = GameSettings.GameParams.zValues.zWorld
        object.name = "projectile"
        let tileAtlas = SKTextureAtlas(named: "Tiles")
        object.texture = tileAtlas.textureNamed("gumdrop")
        gameScene.projectileLayer.addChild(object)
        let throwAction = SKAction.moveToX(object.position.x + throwDistance, duration: 0.5)
        taperThrow()
        let waitAction = SKAction.waitForDuration(1)
        let removeAction = SKAction.removeFromParent()
        let actionSeq = SKAction.sequence([throwAction, waitAction, removeAction])
        object.runAction(actionSeq, completion: { () -> Void in
            //self.scrollerComponent.isThrowing = false
            
        })
            
        }
    }

}
