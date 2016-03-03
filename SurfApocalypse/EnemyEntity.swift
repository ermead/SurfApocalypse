//
//  EnemyEntity.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 3/2/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import SpriteKit
import GameplayKit


@available(OSX 10.11, *)
class EnemyEntity: SGEntity {
    
    var spriteComponent: SpriteComponent!
    var physicsComponent: PhysicsComponent!
    var animationComponent: AnimationComponent!
    var item: String!
    var atlas: SKTextureAtlas = SKTextureAtlas(named: "Tiles")
    
    init(position: CGPoint, size: CGSize, texture:SKTexture, item: String) {
        super.init()
        
        //Initialize components
        spriteComponent = SpriteComponent(entity: self, texture: texture, size: size, position:position)
        addComponent(spriteComponent)
        animationComponent = AnimationComponent(node: spriteComponent.node, animations: loadAnimations(atlas))
        addComponent(animationComponent)
        physicsComponent = PhysicsComponent(entity: self, bodySize: CGSize(width: spriteComponent.node.size.width * 0.8, height: spriteComponent.node.size.height * 0.8), bodyShape: .square, rotation: false)
        physicsComponent.setCategoryBitmask(ColliderType.Destroyable.rawValue, dynamic: false)
        physicsComponent.setPhysicsCollisions(ColliderType.None.rawValue)
        physicsComponent.setPhysicsContacts(ColliderType.Player.rawValue | ColliderType.Projectile.rawValue)
        addComponent(physicsComponent)
        
        //Final setup of components
        spriteComponent.node.physicsBody = physicsComponent.physicsBody
        spriteComponent.node.name = "enemyNode"
        name = "enemyEntity"
        self.item = item
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
        self.spriteComponent.node.position = CGPoint(x:self.spriteComponent.node.position.x + 100, y: self.spriteComponent.node.position.y)
        
    }
    
    func enemyHitAndSpawn(scene: GamePlayMode){
        let gameScene = scene
        if let spriteComponent = self.componentForClass(SpriteComponent.self) {
            let tileAtlas = SKTextureAtlas(named: "Tiles")
            spriteComponent.node.texture = tileAtlas.textureNamed("t_openedBox")
            gameScene.runAction(gameScene.sndCollectGood)
            
            print("enemy hit, spawn collectible here")
            
            let gem = GemEntity(position: CGPoint(x: spriteComponent.node.position.x + 60, y:spriteComponent.node.position.y + 60), size: CGSize(width: 32, height: 32), texture:
                tileAtlas.textureNamed("diamond"), item: "diamond")
            gem.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zWorldFront
            gameScene.addEntity(gem, toLayer: gameScene.worldLayer)
        }
    }
    
    override func contactWith(entity: SGEntity, scene: GamePlayMode) {
        //print("player hit enemy")
        //self.treasureBoxHitAndSpawn(scene)
    }
    
    func loadAnimations(textureAtlas:SKTextureAtlas) -> [AnimationState: Animation] {
        var animations = [AnimationState: Animation]()
        
        animations[AnimationState.EnemyWalk] = AnimationComponent.animationFromAtlas(textureAtlas,
            withImageIdentifier: AnimationState.EnemyWalk.rawValue,
            forAnimationState: .EnemyWalk, repeatTexturesForever: true, textureSize: CGSize(width: 40.1, height: 48.0))
        
        return animations
    }
    
    
}
