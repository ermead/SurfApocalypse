//
//  BackgroundEntity.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class BackgroundEntity: GKEntity {
    
    var spriteComponent: SpriteComponent!
    
    init(movementFactor:CGPoint, image:SKTexture, size:CGSize, position:CGPoint, reset:Bool) {
        super.init()
        
        //Initialize components
        spriteComponent = SpriteComponent(entity: self, texture: image, size: size, position:position)
        addComponent(spriteComponent)
        
        let parallaxComponent = ParallaxComponent(entity: self, movementFactor: movementFactor, spritePosition: spriteComponent.node.position, reset: reset)
        addComponent(parallaxComponent)
    }
    
}


