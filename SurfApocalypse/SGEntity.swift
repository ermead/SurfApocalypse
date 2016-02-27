//
//  SGEntity.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/26/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import SpriteKit
import GameplayKit

class SGEntity: GKEntity {
    
    var name = ""
    
    func contactWith(entity:SGEntity) {
        //Overridden by subclass
    }
    
}
