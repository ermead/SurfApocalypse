//
//  ChaseScrollMovement.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import SpriteKit
import GameplayKit

class ChaseScrollComponent: GKComponent {
    
    var movementSpeed = CGPoint(x: 85.0, y: 0.0)
    
    var spriteComponent: SpriteComponent {
        guard let spriteComponent = entity?.componentForClass(SpriteComponent.self) else { fatalError("SpriteComponent Missing") }
        return spriteComponent
    }
    
    init(entity: GKEntity) {
        super.init()
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
        
        //Move sprite
        spriteComponent.node.position += (movementSpeed * CGFloat(seconds))
        
    }
    
}


