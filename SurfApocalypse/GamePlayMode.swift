//
//  GamePlayMode.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GamePlayMode: SGScene {
    
    //MARK: Instance Variables
    
    var characterIndex = 0
    var levelIndex = 0
    
    //Generators
    
    //Layers
    
    var worldLayer: TileLayer!
    var backgroundLayer: SKNode!
    
    //States
    
    lazy var stateMachine: GKStateMachine = GKStateMachine(states: [
        GameSceneInitialState(scene: self),
        GameSceneActiveState(scene: self),
        GameScenePausedState(scene: self),
        GameSceneVictorySeqState(scene: self),
        GameSceneWinState(scene: self),
        GameSceneLoseState(scene: self)
        ])
    
    //ECS
    
    var entities = Set<GKEntity>()
    
    //Component Systems
    
    lazy var componentSystems: [GKComponentSystem] = {
        let parallaxSystem = GKComponentSystem(componentClass: ParallaxComponent.self)
        let animationSystem = GKComponentSystem(componentClass: AnimationComponent.self)
    
        return [parallaxSystem, animationSystem ]
    }()
    
    //Timers
    
    var lastUpdateTimeInterval: NSTimeInterval = 0
    let maximumUpdateDeltaTime: NSTimeInterval = 1.0 / 60.0
    var lastDeltaTime: NSTimeInterval = 0
    
    //Controls
    
    //Sounds
    
    //MARK: Initializer
    
    override func didMoveToView(view: SKView) {
        stateMachine.enterState(GameSceneInitialState.self)
    }
    
    //MARK: Functions
    
    func addEntity(entity: GKEntity,toLayer layer:SKNode) {
        //Add Entity to set
        entities.insert(entity)
        
        //Add Sprites to Scene
        if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
            layer.addChild(spriteNode)
        }
        
        //Add Components to System
        for componentSystem in self.componentSystems {
            componentSystem.addComponentWithEntity(entity)
        }
        
        //scrollerSystem.addComponentWithEntity(entity)
        
    }
    
    //MARK: Life Cycle
    
    override func update(currentTime: NSTimeInterval) {
        var deltaTime = currentTime - lastUpdateTimeInterval
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
        lastUpdateTimeInterval = currentTime
        
        //Update Components
        
        for componentSystem in componentSystems {
            componentSystem .updateWithDeltaTime(deltaTime)
        }
        
         //Update Game
        
    }
    
    //MARK: Responders:
    
    override func screenInteractionStarted(location: CGPoint) {
        
    }
    
    override func screenInteractionMoved(location: CGPoint) {
        

    }
    
    override func screenInteractionEnded(location: CGPoint) {
        
    }
    
    override func buttonEvent(event: String, velocity: Float, pushedOn: Bool) {
        
    }
    
    override func stickEvent(event: String, point: CGPoint) {
        
    }
}
