//
//  PlayModeStates.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

@available(OSX 10.11, *)
class GameSceneState: GKState {
    unowned let gs: GamePlayMode
    init(scene: GamePlayMode) {
        self.gs = scene
    }
}

@available(OSX 10.11, *)
class GameSceneInitialState: GameSceneState {
    
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        //Delegates
        
        gs.physicsWorld.contactDelegate = gs
        gs.physicsWorld.gravity = CGVector(dx: 0, dy: -2.0)
        
        //Camera
        let myCamera = SKCameraNode()
        gs.camera = myCamera
        gs.addChild(myCamera)
        gs.camera?.setScale(0.64)
        
        //Layers
        
        gs.worldLayer = TileLayer(levelIndex: gs.levelIndex, typeIndex: .setMain)
        gs.addChild(gs.worldLayer)
        gs.backgroundLayer = SKNode()
        gs.overlayGUI = SKNode()
        gs.projectileLayer = SKNode()
        gs.addChild(gs.projectileLayer)
        myCamera.addChild(gs.backgroundLayer)
        myCamera.addChild(gs.overlayGUI)
        
        
        //Initial Entities
        let background01 = BackgroundEntity(movementFactor: CGPoint(x: -0.33, y: 0.0), image: SKTexture(imageNamed: "BG001") , size: SKMSceneSize!, position:CGPointZero, reset: true)
        background01.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground01
        gs.addEntity(background01, toLayer:gs.backgroundLayer)
        let background02 = BackgroundEntity(movementFactor: CGPoint(x: -0.33, y: 0.0), image: SKTexture(imageNamed: "BG001") , size: SKMSceneSize!, position:CGPoint(x: SKMSceneSize!.width, y: 0), reset: true)
        background02.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground01
        gs.addEntity(background02, toLayer:gs.backgroundLayer)
        let background03 = BackgroundEntity(movementFactor: CGPoint(x: -0.66, y: 0.0), image: SKTexture(imageNamed: "BG002") , size: SKMSceneSize!, position:CGPointZero, reset: true)
        background03.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground02
        gs.addEntity(background03, toLayer:gs.backgroundLayer)
        let background04 = BackgroundEntity(movementFactor: CGPoint(x: -0.66, y: 0.0), image: SKTexture(imageNamed: "BG002") , size: SKMSceneSize!, position:CGPoint(x: SKMSceneSize!.width, y: 0), reset: true)
        background04.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground02
        gs.addEntity(background04, toLayer:gs.backgroundLayer)
        let background05 = BackgroundEntity(movementFactor: CGPoint(x: -1.00, y: 0.0), image: SKTexture(imageNamed: "BG003") , size: SKMSceneSize!, position:CGPointZero, reset: true)
        background05.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground03
        gs.addEntity(background05, toLayer:gs.backgroundLayer)
        let background06 = BackgroundEntity(movementFactor: CGPoint(x: -1.00, y: 0.0), image: SKTexture(imageNamed: "BG003") , size: SKMSceneSize!, position:CGPoint(x: SKMSceneSize!.width, y: 0), reset: true)
        background06.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground03
        gs.addEntity(background06, toLayer:gs.backgroundLayer)
        
        let characters = ["Male", "Female"]
        //let atlas = SKTextureAtlas(named: characters[gs.characterIndex])
        let atlas = SKTextureAtlas(named: "Female")
        
        
        if let playerPlaceholder = gs.worldLayer.childNodeWithName("placeholder_StartPoint") {
            let player = PlayerEntity(position: playerPlaceholder.position, size: CGSize(width: 25.4, height: 48.0), firstFrame: atlas.textureNamed("Idle__000"), atlas: atlas, scene:gs)
            player.spriteComponent.node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            player.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zPlayer
            player.animationComponent.requestedAnimationState = .Run
            gs.centerCameraOnPoint(playerPlaceholder.position)
            gs.addEntity(player, toLayer: gs.worldLayer)
            gs.worldFrame = gs.worldLayer.calculateAccumulatedFrame()
            gs.setCameraConstraints()
        } else {
            fatalError("[Play Mode: No placeholder for player!")
        }
        
        gs.worldLayer.enumerateChildNodesWithName("placeholder_FinishPoint") { (node, stop) -> Void in
            let finish = FinishEntity(position: node.position, size: CGSize(width: 32, height: 32), texture: SKTexture())
            self.gs.addEntity(finish, toLayer: self.gs.worldLayer)
        }
        
        let tileAtlas = SKTextureAtlas(named: "Tiles")
        
        gs.worldLayer.enumerateChildNodesWithName("placeholder_Gem") { (node, stop) -> Void in
            let gem = GemEntity(position: node.position, size: CGSize(width: 32, height: 32), texture: tileAtlas.textureNamed("gem"), item: "gem")
            gem.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zWorldFront
            self.gs.addEntity(gem, toLayer: self.gs.worldLayer)
        }
        gs.worldLayer.enumerateChildNodesWithName("placeholder_Gem_diamond") { (node, stop) -> Void in
            let gem = GemEntity(position: node.position, size: CGSize(width: 32, height: 32), texture: tileAtlas.textureNamed("diamond"), item: "diamond")
            gem.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zWorldFront
            self.gs.addEntity(gem, toLayer: self.gs.worldLayer)
        }
        gs.worldLayer.enumerateChildNodesWithName("placeholder_Gem_gumdrop") { (node, stop) -> Void in
            let gem = GemEntity(position: node.position, size: CGSize(width: 32, height: 32), texture: tileAtlas.textureNamed("gumdrop"), item: "gumdrop")
            gem.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zWorldFront
            self.gs.addEntity(gem, toLayer: self.gs.worldLayer)
            
        }
        
        gs.worldLayer.enumerateChildNodesWithName("placeholder_treasureBox") { (node, stop) -> Void in
            let treasureBox = TreasureBoxEntity(position: node.position, size: CGSize(width: 32, height: 32), texture: tileAtlas.textureNamed("t_treasureBox"), item: "treasureBox")
            treasureBox.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zWorldFront
            self.gs.addEntity(treasureBox, toLayer: self.gs.worldLayer)
            
        }
        
        
        /*
        let killZone = KillZoneEntity(position: gs.worldFrame.origin, size: CGSize(width: 20.0, height: gs.worldFrame.size.height), texture: SKTexture(noiseWithSmoothness: 0.5, size: CGSize(width: 20.0, height: gs.worldFrame.size.height), grayscale: true))
        killZone.spriteComponent.node.alpha = 0.5
        killZone.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zPlayer + 2
        killZone.spriteComponent.node.position = CGPoint(x: killZone.spriteComponent.node.position.x + (killZone.spriteComponent.node.size.width / 2), y: killZone.spriteComponent.node.position.y + (killZone.spriteComponent.node.size.height / 2))
        gs.addEntity(killZone, toLayer: gs.worldLayer)
        */
        
        //Setup UI
        let pauseButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        pauseButton.posByScreen(0.46, y: 0.42)
        pauseButton.fontSize = 40
        pauseButton.text = gs.lt("II")
        pauseButton.fontColor = SKColor.whiteColor()
        pauseButton.zPosition = 150
        pauseButton.name = "PauseButton"
        gs.overlayGUI.addChild(pauseButton)
        
        let mainMenuButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        mainMenuButton.posByScreen(0.35, y: 0.42)
        mainMenuButton.fontSize = 25
        mainMenuButton.text = gs.lt("Main")
        mainMenuButton.fontColor = SKColor.whiteColor()
        mainMenuButton.zPosition = 150
        mainMenuButton.name = "mainMenuButton"
        gs.overlayGUI.addChild(mainMenuButton)
        
    }
    
    override func willExitWithNextState(nextState: GKState) {
        
    }
}

@available(OSX 10.11, *)
class GameSceneActiveState: GameSceneState {
    
}

@available(OSX 10.11, *)
class GameScenePausedState: GameSceneState {
    override func didEnterWithPreviousState(previousState: GKState?) {
        gs.pauseLoop = true
        gs.paused = true
    }
    override func willExitWithNextState(nextState: GKState) {
        gs.pauseLoop = false
        gs.paused = false
    }
}

@available(OSX 10.11, *)
class GameSceneVictorySeqState: GameSceneState {
    
}

@available(OSX 10.11, *)
class GameSceneWinState: GameSceneState {
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        let nextScene = PostScreen(size: gs.scene!.size)
        nextScene.level = gs.levelIndex
        nextScene.win = true
        nextScene.gems = gs.gemsCollected
        nextScene.gumdrops = gs.gumdropsCollected
        nextScene.diamonds = gs.diamondsCollected
        nextScene.scaleMode = gs.scaleMode
        gs.view?.presentScene(nextScene)
    }
}

@available(OSX 10.11, *)
class GameSceneLoseState: GameSceneState {
    override func didEnterWithPreviousState(previousState: GKState?) {
        let nextScene = PostScreen(size: gs.scene!.size)
        nextScene.level = gs.levelIndex
        nextScene.win = false
        nextScene.gems = gs.gemsCollected
        nextScene.gumdrops = gs.gumdropsCollected
        nextScene.diamonds = gs.diamondsCollected
        nextScene.scaleMode = gs.scaleMode
        gs.view?.presentScene(nextScene)
    }
}

