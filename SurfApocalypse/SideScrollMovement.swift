//
//  SideScrollMovement.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import SpriteKit
import GameplayKit

struct ControlScheme {
    
    //Input
    var jumpPressed:Bool = false
    var throwPressed:Bool = false
    
}

@available(OSX 10.11, *)
class SideScrollComponentSystem: GKComponentSystem {
    
    func updateWithDeltaTime(seconds: NSTimeInterval, controlInput: ControlScheme) {
        for component in components {
            if let comp = component as? SideScrollComponent {
                comp.updateWithDeltaTime(seconds, controlInput: controlInput)
            }
        }
    }
}

@available(OSX 10.11, *)
class SideScrollComponent: GKComponent {
    
    var movementSpeed = CGPoint(x: 130.0, y: 0.0)
    
    //State
    var isJumping = false
    var jumpTime:CGFloat = 0.0
    var isThrowing = false


    var groundY:CGFloat = 0.0
    var previousY:CGFloat = 0.0
    
    var spriteComponent: SpriteComponent {
        guard let spriteComponent = entity?.componentForClass(SpriteComponent.self) else { fatalError("SpriteComponent Missing") }
        return spriteComponent
    }
    
    var animationComponent: AnimationComponent {
        guard let animationComponent = entity?.componentForClass(AnimationComponent.self) else { fatalError("AnimationComponent Missing") }
        return animationComponent
    }
   
    
    init(entity: GKEntity) {
        super.init()
        
    }
    
    func updateWithDeltaTime(seconds: NSTimeInterval, controlInput: ControlScheme) {
        super.updateWithDeltaTime(seconds)
        
        //Move sprite
        spriteComponent.node.position += (movementSpeed * CGFloat(seconds))
        
        if let playerEnt = entity as? PlayerEntity {
            
            if playerEnt.spriteComponent.node.position.y <= -(playerEnt.gameScene.frame.height/2) {
                print("Fallen Off!")
                playerEnt.playerDied()
            }
        }
        
        //Jump
     
        if controlInput.jumpPressed && !isJumping {
            
            if let playerEnt = entity as? PlayerEntity {
                playerEnt.gameScene.runAction(playerEnt.gameScene.sndJump)
                playerEnt.isJumping = true
            }
            
            print("first jump")
            isJumping = true
            jumpTime = 0.05
            animationComponent.requestedAnimationState = .Jump
            
        }
        
        if (jumpTime > 0.0) {
            jumpTime = jumpTime - CGFloat(seconds)
            spriteComponent.node.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: (seconds * 120.0)), atPoint: spriteComponent.node.position)
            if ((spriteComponent.node.position.y - groundY) > 57) || ((spriteComponent.node.position.y <= previousY) && ((spriteComponent.node.position.y - groundY) > 2)) {
                isJumping = false
                if let playerEnt = entity as? PlayerEntity {
                    playerEnt.isJumping = false
                }
              
            }
            
        }
        
        if spriteComponent.node.physicsBody?.allContactedBodies().count > 0 {
            for body in (spriteComponent.node.physicsBody?.allContactedBodies())! {
                let nodeDir = ((body.node?.position)! - spriteComponent.node.position).angle
                if (nodeDir > -2.355 && nodeDir < -0.785) {
                    isJumping = false
                    if let playerEnt = entity as? PlayerEntity {
                        playerEnt.isJumping = false
                    }
                    animationComponent.requestedAnimationState = .Run
                }
            }
        }
        
        
        //THROWING
        if controlInput.throwPressed && isThrowing == false {
            
            if let playerEnt = entity as? PlayerEntity {
            
            //playerEnt.gameScene.runAction(playerEnt.gameScene.sndThrow)
            
                //if playerEnt.gameScene.projectileLayer.children.count < 4 {
                if playerEnt.gameScene.gumdropsCollected > 0 {
                    
                    playerEnt.gameScene.gumdropsCollected -= 2
                    
                    isThrowing = true
                    playerEnt.isThrowing = true
                    
                    animationComponent.requestedAnimationState = AnimationState.IdleThrow
                    
                    playerEnt.throwObject()
                    
                    }
                
                let actionWait = SKAction.waitForDuration(0.2)
                playerEnt.gameScene.runAction(actionWait, completion: { () -> Void in
                    
                    self.isThrowing = false
                    playerEnt.isThrowing = false
                })
             
            }
            
        }
        
    }
 
    
}

