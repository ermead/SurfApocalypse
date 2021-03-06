//
//  LevelSelect.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//


import SpriteKit


@available(OSX 10.11, *)
class LevelSelect: SGScene {
    
    //Sounds
    let sndButtonClick = SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false)
    
    var characterIndex = 0
    
    let levelLayer = SKNode()
    
    var buildMode: Bool = false
    
    override func didMoveToView(view: SKView) {
        
        if buildMode {
            print("in build mode...")
        }
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.posByCanvas(0.5, y: 0.5)
        background.xScale = 1.2
        background.yScale = 1.2
        background.zPosition = -1
        addChild(background)
        
        let nameBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        nameBlock.posByScreen(0.5, y: 0.9)
        nameBlock.fontColor = SKColor.blueColor()
        nameBlock.fontSize = 54
        nameBlock.text = "Select a Level:"
        addChild(nameBlock)
        
        //Next and previous page
        
        
        //Show levels
      
        showLevelsFrom(0)
        
        
    }
    
    func showLevelsFrom(index:Int) {
        
        for node in levelLayer.children {
            node.removeFromParent()
        }
        
        let gridSize = CGSize(width: 3, height: 2)
        let gridSpacing = CGSize(width: 160, height: -120)
        let gridStart = CGPoint(screenX: 0.1, screenY: 0.75)
        //var gridIndex = 0
        
        var currentX = 0
        var currentY = 0
        var lastAvail = false
        
        for (index, _) in tileMapLevels.MainSet.enumerate() {
            
            var available:Bool
            if !(index == 0) {
                available = NSUserDefaults.standardUserDefaults().boolForKey("Level_\(index)")
            } else {
                available = true
            }
            
            let sign = SKSpriteNode(texture: SKTexture(imageNamed: "Sign_1"))
            sign.position = CGPoint(x: gridStart.x + (gridSpacing.width * CGFloat(currentX)), y: gridStart.y + (gridSpacing.height * CGFloat(currentY)))
            sign.size = CGSize(width: 100, height: 100)
            sign.zPosition = 20
            sign.userData = ["Index":index,"Available":(available || lastAvail)]
            sign.name = "LevelSign"
            addChild(sign)
            
            let signText = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            signText.position = sign.position
            signText.fontColor = SKColor.whiteColor()
            signText.fontSize = 32
            signText.zPosition = 21
            signText.text = (available || lastAvail) ? "\(index + 1)" : "X"
            addChild(signText)
            
            let gems = NSUserDefaults.standardUserDefaults().integerForKey("\(index)gems") as Int
            
            /*
            for var i = 0; i < gems; i++ {
                let gem = SKSpriteNode(imageNamed: "gem")
                gem.size = CGSize(width: 22, height: 22)
                gem.position = CGPoint(x: (-(sign.size.width / 3) + ((sign.size.width / 3) * CGFloat(i))) as CGFloat , y: -(sign.size.height / 2.5))
                gem.zPosition = 22
                sign.addChild(gem)
            }
            */
            
            currentX++
            if currentX > Int(gridSize.width) {
                currentX = 0
                currentY++
            }
            if available {
                lastAvail = true
            } else {
                lastAvail = false
            }
            
        }
        
    }
    
    override func screenInteractionStarted(location: CGPoint) {
    
        for node in nodesAtPoint(location) {
            if let theNode:SKNode = node,
                let nodeName = theNode.name {
                  
                    if nodeName == "LevelSign" {
                        if theNode.userData!["Available"] as! Bool == true {
                            self.runAction(sndButtonClick)
                            if buildMode == false {
                                let nextScene = GamePlayMode(size: self.scene!.size)
                                nextScene.characterIndex = self.characterIndex
                                nextScene.levelIndex = (theNode.userData!["Index"] as? Int)!
                                nextScene.scaleMode = self.scaleMode
                                self.view?.presentScene(nextScene)
                            } else {
                                let nextScene = GameBuildMode(size: self.scene!.size)
                                nextScene.levelIndex = (theNode.userData!["Index"] as? Int)!
                                nextScene.scaleMode = self.scaleMode
                                self.view?.presentScene(nextScene)
                            }
                        }
                    }
            }
        }
    }
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
       
        //TODO: fix the level select index functionality for apple tv
        self.runAction(sndButtonClick)
        if buildMode == false {
            let nextScene = GamePlayMode(size: self.scene!.size)
            nextScene.characterIndex = self.characterIndex
            nextScene.levelIndex = 0
            nextScene.scaleMode = self.scaleMode
            self.view?.presentScene(nextScene)
        } else {
            let nextScene = GameBuildMode(size: self.scene!.size)
            nextScene.levelIndex = 0
            nextScene.scaleMode = self.scaleMode
            self.view?.presentScene(nextScene)
        }
   
    }
    #endif
}





