//
//  ParallaxComponent.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import SpriteKit
import GameplayKit

class ParallaxComponent: GKComponent {
    
    var movementFactor = CGPointZero
    var pointOfOrigin = CGPointZero
    var resetLocation = false
    
    var spriteComponent: SpriteComponent {
        guard let spriteComponent = entity?.componentForClass(SpriteComponent.self) else { fatalError("SpriteComponent Missing") }
        return spriteComponent
    }
    
    init(entity: GKEntity, movementFactor factor:CGPoint, spritePosition:CGPoint, reset:Bool) {
        super.init()
        
        movementFactor = factor
        pointOfOrigin = spritePosition
        resetLocation = reset
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
        
        //Move Sprite
        spriteComponent.node.position += CGPoint(x: movementFactor.x, y: movementFactor.y)
        
        //Check location
        if (spriteComponent.node.position.x <= (spriteComponent.node.size.width * -1)) && resetLocation == true {
            spriteComponent.node.position = CGPoint(x: spriteComponent.node.size.width, y: 0)
        }
        
        //Add other directions if required.
        
    }
    
}

