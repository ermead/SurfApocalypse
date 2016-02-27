//
//  FinishEntity.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import SpriteKit
import GameplayKit

class FinishEntity: SGEntity {
    
    var spriteComponent: SpriteComponent!
    var physicsComponent: PhysicsComponent!
    
    init(position: CGPoint, size: CGSize, texture:SKTexture) {
        super.init()
        
        //Initialize components
        spriteComponent = SpriteComponent(entity: self, texture: texture, size: size, position:position)
        addComponent(spriteComponent)
        physicsComponent = PhysicsComponent(entity: self, bodySize: CGSize(width: spriteComponent.node.size.width * 0.8, height: spriteComponent.node.size.height * 0.8), bodyShape: .square, rotation: false)
        physicsComponent.setCategoryBitmask(ColliderType.EndLevel.rawValue, dynamic: false)
        physicsComponent.setPhysicsCollisions(ColliderType.None.rawValue)
        physicsComponent.setPhysicsContacts(ColliderType.Player.rawValue)
        addComponent(physicsComponent)
        
        //Final setup of components
        spriteComponent.node.physicsBody = physicsComponent.physicsBody
        spriteComponent.node.name = "finishNode"
        name = "finishEntity"
    }
    
    
}
