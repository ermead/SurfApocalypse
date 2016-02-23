//
//  OSX_Responder.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/22/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation
import SpriteKit


extension SGScene {
    
    
    override func mouseDown(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        screenInteractionStarted(location)
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        screenInteractionMoved(location)
    }
    
    override func mouseUp(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        screenInteractionEnded(location)
    }
    
    override func mouseExited(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        screenInteractionEnded(location)
    }
    
    //handle key events
    
    override func keyDown(theEvent: NSEvent) {
        handleKeyEvent(theEvent, keyDown: true)
    }
    
    override func keyUp(theEvent: NSEvent) {
        handleKeyEvent(theEvent, keyDown: false)
    }
    
    func handleKeyEvent(event: NSEvent, keyDown: Bool){
        guard let characters = event.charactersIgnoringModifiers?.characters else {return}
        
        for character in characters {
            buttonEvent("\(character)", velocity: 1.0, pushedOn: keyDown)
        }
    }
}