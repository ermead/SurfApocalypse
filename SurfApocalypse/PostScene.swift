//
//  PostScene.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import Foundation

import SpriteKit

@available(OSX 10.11, *)
class PostScreen: SGScene {
    
    var level:Int?
    var win:Bool?
    var gems:Int = 0
    var diamonds: Int = 0
    var gumdrops: Int = 0
    
    override func didMoveToView(view: SKView) {
        
        layoutScene()
        saveStats()
        
    }
    
    func layoutScene() {
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.posByCanvas(0.5, y: 0.5)
        background.xScale = 1.2
        background.yScale = 1.2
        background.zPosition = -1
        addChild(background)
        
        let nameBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        nameBlock.posByScreen(0.5, y: 0.7)
        nameBlock.fontColor = SKColor.blueColor()
        nameBlock.fontSize = 64
        if (win != nil) {
            nameBlock.text = win! ? "You Won!" : "Try Again!"
        }
        addChild(nameBlock)
        
        let gemsBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        gemsBlock.posByScreen(0.5, y: 0.5)
        gemsBlock.fontColor = SKColor.whiteColor()
        gemsBlock.fontSize = 22
        gemsBlock.text = "\(gems) gems collected"
        addChild(gemsBlock)
        
        let diamondsBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        diamondsBlock.posByScreen(0.5, y: 0.4)
        diamondsBlock.fontColor = SKColor.whiteColor()
        diamondsBlock.fontSize = 22
        diamondsBlock.text =  "\(diamonds) diamonds collected"
        addChild(diamondsBlock)
        
        let gumdropsBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        gumdropsBlock.posByScreen(0.5, y: 0.3)
        gumdropsBlock.fontColor = SKColor.whiteColor()
        gumdropsBlock.fontSize = 22
        gumdropsBlock.text = "\(gumdrops) gumdrops collected"
        addChild(gumdropsBlock)
        
    }
    
    func saveStats() {
        if win! {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Level_\(level!)")
            if gems > NSUserDefaults.standardUserDefaults().integerForKey("\(level!)gems") {
                NSUserDefaults.standardUserDefaults().setInteger(gems, forKey: "\(level!)gems")
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        
        let nextScene = MainMenu(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
        
    }
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        let nextScene = MainMenu(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
    }
    #endif
    
}
