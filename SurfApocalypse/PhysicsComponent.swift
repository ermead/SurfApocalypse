//
//  PhysicsComponent.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import SpriteKit
import GameplayKit

enum PhysicsBodyShape {
    case square
    case squareOffset
    case circle
    case topOutline
    case bottomOutline
}

@available(OSX 10.11, *)
class PhysicsComponent: GKComponent {
    
    var physicsBody = SKPhysicsBody()
    
    init(entity: GKEntity, bodySize: CGSize, bodyShape: PhysicsBodyShape, rotation: Bool) {
        
        switch bodyShape {
        case.square:
            physicsBody = SKPhysicsBody(rectangleOfSize: bodySize)
            break
        case.squareOffset:
            physicsBody = SKPhysicsBody(rectangleOfSize: bodySize, center: CGPoint(x: 0, y: bodySize.height/2 + 2))
            break
        case .circle:
            physicsBody = SKPhysicsBody(circleOfRadius: bodySize.width / 2)
            break
        case .topOutline:
            physicsBody = SKPhysicsBody(edgeFromPoint: CGPoint(x: (bodySize.width/2) * -1, y: bodySize.height/2), toPoint: CGPoint(x: bodySize.width/2, y: bodySize.height/2))
            break
        case .bottomOutline:
            physicsBody = SKPhysicsBody(edgeFromPoint: CGPoint(x: (bodySize.width/2) * -1, y: (bodySize.height/2) * -1), toPoint: CGPoint(x: bodySize.width/2, y: (bodySize.height/2) * -1))
            break
        }
        
        physicsBody.allowsRotation = rotation
        
        //Defaults
        physicsBody.dynamic = true
        physicsBody.contactTestBitMask = ColliderType.None.rawValue
        physicsBody.collisionBitMask = ColliderType.None.rawValue
    }
    
    func setCategoryBitmask(bitmask:UInt32, dynamic: Bool) {
        
        physicsBody.categoryBitMask = bitmask
        physicsBody.dynamic = dynamic
        
    }
    
    func setPhysicsCollisions(bitmask:UInt32) {
        
        physicsBody.collisionBitMask = bitmask
        
    }
    
    func setPhysicsContacts(bitmask:UInt32) {
        
        physicsBody.contactTestBitMask = bitmask
        
    }
    
}

