//
//  AppDelegate.swift
//  SurfApocalypse_OSX
//
//  Created by Eric Mead on 2/21/16.
//  Copyright (c) 2016 Eric Mead. All rights reserved.
//


import Cocoa
import SpriteKit

@available(OSX 10.11, *)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        let scene = GameScene(size: CGSize(width: 1024, height: 768))
        
        scene.scaleMode = .AspectFit
        
        _ = SGResolution(screenSize: skView.bounds.size, canvasSize: scene.size)
        
        self.skView!.presentScene(scene)
        
        self.skView!.ignoresSiblingOrder = true
        
        
        self.skView!.showsFPS = GameSettings.Debugging.ALL_ShowFrameRate
        self.skView!.showsNodeCount = GameSettings.Debugging.ALL_ShowNodeCount
        
        
        if (GameSettings.Defaults.OSX_Start_FullScreen) {
            self.window.toggleFullScreen(nil)
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}
