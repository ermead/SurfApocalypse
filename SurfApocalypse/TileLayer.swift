//
//  TileLayer.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import SpriteKit
import GameplayKit

let randomSceneryArt = ["Mushroom_1","Mushroom_2","Stone"]

@available(OSX 10.11, *)
class TileLayer: SKNode, tileMapDelegate {
    
    var levelGenerator = tileMapBuilder()
    let randomScenery = GKRandomDistribution(forDieWithSideCount: randomSceneryArt.count)
    
    init(levelIndex:Int, typeIndex:setType) {
        super.init()
        
        levelGenerator.delegate = self
        
        levelGenerator.loadLevel(levelIndex, fromSet: typeIndex)
        levelGenerator.presentLayerViaDelegate()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: tileMapDelegate
    
    func createNodeOf(type type:tileType, location:CGPoint) {
        //Load texture atlas
        let atlasTiles = SKTextureAtlas(named: "Tiles")
        
        //Handle each object
        switch type {
        case .tileAir:
            //Intentionally left blank
            break
        case .tileGroundLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGround:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("3"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileWallLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("4"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundMiddle:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("5"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            addChild(node)
            break
        case .tileWallRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("6"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileGroundCornerR:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("7"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundCornerRU:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("8"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileCeiling:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("9"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .bottomOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundCornerLU:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("10"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileGroundCornerL:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("11"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileCeilingLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("12"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tilePlatformLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("13"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tilePlatform:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("14"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tilePlatformRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("15"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileCeilingRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("16"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileWaterSurface:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("17"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            addChild(node)
            break
        case .tileWater:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("18"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileRandomScenery:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed(randomSceneryArt[randomScenery.nextInt() - 1]))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        
            
        case .tileSignPost:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Sign_1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileSignArrow:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Sign_2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileCrate:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Crate"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Destroyable.rawValue, dynamic: true)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue | ColliderType.Wall.rawValue | ColliderType.Destroyable.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGem:
            let node = SKNode()
            node.position = location
            node.name = "placeholder_Gem"
            addChild(node)
            break
        case .tileStartLevel:
            let node = SKNode()
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.name = "placeholder_StartPoint"
            addChild(node)
            break
        case .tileEndLevel:
            let node = SKNode()
            node.position = location
            node.name = "placeholder_FinishPoint"
            addChild(node)
            break
            
        case .tileTree1:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Tree_1"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileTree2:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Tree_2"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileTree3:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Tree_3"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileCastle:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("castle"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileGumdrop:
            let node = SKNode()
            node.position = location
            node.name = "placeholder_Gem_gumdrop"
            addChild(node)
            break
            
        case .tileDiamond:
            let node = SKNode()
            node.position = location
            node.name = "placeholder_Gem_diamond"
            addChild(node)
            break
            
        case .tileRock1:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("rock1"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileRock2:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("rock2"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileGinger:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("ginger"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileBush:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("bush"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileBushes:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("bushes"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
            
        case .tileGrass:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("grass"))
            node.xScale = 0.5
            node.yScale = 0.5
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
         
        default:
            break
            
        }
        
        
    }
    
}
