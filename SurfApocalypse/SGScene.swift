//
//  SGScene.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/22/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit

class SGScene: SKScene {
    
    func screenInteractionStarted(location: CGPoint) {
        
    }
    
    func screenInteractionMoved(location: CGPoint) {
        
    }
    
    func screenInteractionEnded(location: CGPoint) {
        
    }
    
    func buttonEvent(event: String, velocity: Float, pushedOn: Bool){
        
    }
    
    func stickEvent(event: String, point: CGPoint){
        
    }
    
    func centerCameraOnPoint(point: CGPoint) {
        
        if #available(OSX 10.11, *) {
            if let camera = camera {
                camera.position = point
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func lt(text:String) -> String {
        
        return NSLocalizedString(text, comment: "")
        
    }
    
    
    
}
