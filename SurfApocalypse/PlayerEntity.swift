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

class PlayerEntity: GKEntity {
    
    var spriteComponent: SpriteComponent!
    var animationComponent: AnimationComponent!
    var gameScene:GamePlayMode!
    
    init(position: CGPoint, size: CGSize, firstFrame:SKTexture, atlas: SKTextureAtlas, scene:GamePlayMode) {
        super.init()
        
        gameScene = scene
        
        //Initialize components
        spriteComponent = SpriteComponent(entity: self, texture: SKTexture(), size: size, position:position)
        addComponent(spriteComponent)
        animationComponent = AnimationComponent(node: spriteComponent.node, animations: loadAnimations(atlas))
        addComponent(animationComponent)
        
    }
    
    func loadAnimations(textureAtlas:SKTextureAtlas) -> [AnimationState: Animation] {
        var animations = [AnimationState: Animation]()
        
        animations[.Jump] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.Jump.rawValue,
            forAnimationState: .Jump, repeatTexturesForever: false, textureSize: CGSize(width: 40.1, height: 48.0))
        animations[.Run] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.Run.rawValue,
            forAnimationState: .Run, repeatTexturesForever: true, textureSize: CGSize(width: 37.93, height: 48.0))
        animations[.IdleThrow] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.IdleThrow.rawValue,
            forAnimationState: .IdleThrow, repeatTexturesForever: false, textureSize: CGSize(width: 40.1, height: 48.0))
        
        return animations
    }
    
    
    
    
    
    
    
}
