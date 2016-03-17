//
//  AnimationComponent.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import SpriteKit
import GameplayKit

struct Animation {
    let animationState: AnimationState
    let textures: [SKTexture]
    let repeatTexturesForever: Bool
    let textureSize: CGSize
    let timing: NSTimeInterval
}

@available(OSX 10.11, *)
class AnimationComponent: GKComponent {
    
    static let actionKey = "Action"
    
    var timing: NSTimeInterval
    let node: SKSpriteNode
    var animations: [AnimationState: Animation]
    private(set) var currentAnimation: Animation?
    var requestedAnimationState: AnimationState?
    
    init(node: SKSpriteNode, animations: [AnimationState: Animation], timing: NSTimeInterval) {
        self.node = node
        self.animations = animations
        self.timing = timing
    }
    
    private func runAnimationForAnimationState(animationState:
        AnimationState) {
            
            if currentAnimation != nil &&
                currentAnimation!.animationState == animationState { return }
            
            guard let animation = animations[animationState] else {
                print("Unknown animation for state \(animationState.rawValue)")
                return
            }
            
            node.removeActionForKey(AnimationComponent.actionKey)
            
            let texturesAction: SKAction
            if animation.repeatTexturesForever {
                texturesAction = SKAction.repeatActionForever(
                    SKAction.animateWithTextures(animation.textures,
                        timePerFrame: self.timing))
            } else {
                texturesAction = SKAction.animateWithTextures(animation.textures,
                    timePerFrame: self.timing)
            }
            
            node.runAction(texturesAction, withKey: AnimationComponent.actionKey)
            node.size = animation.textureSize
            
            currentAnimation = animation
    }
    
    override func updateWithDeltaTime(deltaTime: NSTimeInterval) {
        super.updateWithDeltaTime(deltaTime)
        if let animationState = requestedAnimationState {
            runAnimationForAnimationState(animationState)
            requestedAnimationState = nil
        }
    }
    
    class func animationFromAtlas(atlas: SKTextureAtlas, withImageIdentifier
        identifier: String, forAnimationState animationState: AnimationState,
        repeatTexturesForever: Bool = true, textureSize:CGSize, timing: NSTimeInterval) -> Animation {
            let textures = atlas.textureNames.filter {
                $0.containsString("\(identifier)")
                }.sort {
                    $0 < $1 }.map {
                        atlas.textureNamed($0)
            }
            return Animation (
                animationState: animationState,
                textures: textures,
                repeatTexturesForever: repeatTexturesForever,
                textureSize: textureSize,
                timing: timing
            )
    }
}
