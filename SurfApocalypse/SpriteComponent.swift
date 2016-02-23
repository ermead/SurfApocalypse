//
//  SpriteComponent.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityNode: SKSpriteNode {
    weak var entity: GKEntity!
}

class SpriteComponent: GKComponent {
    
    let node: EntityNode
    
    init(entity: GKEntity, texture: SKTexture, size: CGSize, position: CGPoint) {
        node = EntityNode(texture: texture, color: SKColor.whiteColor(), size: size)
        node.position = position
        node.entity = entity
    }
}
