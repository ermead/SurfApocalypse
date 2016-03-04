//
//  EnemyMotionComponent.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 3/3/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import SpriteKit
import GameplayKit

@available(OSX 10.11, *)
class EnemyMotionComponent: GKComponent {
    
    var movementSpeed = CGPoint(x: 85.0, y: 0.0)
    var shouldAnimate = true
    let random = GKRandomDistribution(forDieWithSideCount: 3)
    
    var spriteComponent: SpriteComponent {
        
        guard let spriteComponent = entity?.componentForClass(SpriteComponent.self) else { fatalError("SpriteComponent Missing") }
        return spriteComponent
    }
    
    init(entity: GKEntity) {
        super.init()
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
        
        let random = self.random.nextInt()
        
        //Move sprite
        let action1 = SKAction.moveToX(spriteComponent.node.position.x + CGFloat(20 * random), duration: 1)
        let action2 = SKAction.moveToX(spriteComponent.node.position.x - CGFloat(40 * random), duration: 2.0)
        let waitAction = SKAction.waitForDuration(Double(random/2))
        
        let seq = SKAction.sequence([action1, waitAction, action2, waitAction, action1, waitAction])
        
        //spriteComponent.node.runAction(SKAction.repeatActionForever(seq))
        if shouldAnimate == true {
            
            shouldAnimate = false
            
            spriteComponent.node.runAction(seq) { () -> Void in
            
            self.shouldAnimate = true
            
            }
            
        }
        
        //spriteComponent.node.position += (movementSpeed * CGFloat(seconds))
    }
    
}



