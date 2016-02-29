//
//  TileMapLevels.swift
//  SurfApocalypse
//
//  Created by Eric Mead on 2/23/16.
//  Copyright © 2016 Eric Mead. All rights reserved.
//

import Foundation

enum setType: Int {
    case setMain    = 0
    case setBuilder = 1
}

struct tileMapLevels {
    
    static let MainSet: [[[Int]]] =
    [
        [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 33, 14, 14, 33, 3, 17, 17, 0, 0, 0, 0, 0, 35, 33, 0, 0, 35, 33, 0, 30, 0, 37, 0, 0, 26, 0, 0, 0, 30, 37, 23, 0, 0, 0, 0, 0, 23, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 35, 19, 0, 13, 14, 14, 14, 14, 14, 14, 14, 7, 7, 7, 7, 7, 15, 33, 33, 13, 7, 7, 15, 0, 0, 0, 14, 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 0, 0, 0, 0, 0, 0, 30, 33, 6, 18, 18, 0, 0, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 5, 5, 5, 6, 0, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 5, 6, 0, 30, 33, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 33, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 33, 6, 18, 18, 18, 18, 0, 0, 0, 0, 0, 23, 19, 0, 0, 0, 0, 4, 5, 5, 5, 6, 35, 0, 0, 0, 13, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 14, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 32, 32, 18, 32, 32, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 4, 5, 5, 5, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 28, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 19, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 7, 14, 14, 14, 7, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 9, 9, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 13, 2, 2, 2, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 19, 0, 0, 0, 0, 1, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 0, 13, 15, 0, 0, 14, 0, 0, 4, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 22, 0, 0, 33, 0, 0, 13, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 4, 5, 5],
            [0, 24, 0, 29, 23, 23, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 21, 0, 0, 19, 1, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 27, 19, 27, 19, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 35, 35, 27, 27, 28, 33, 19, 27, 19, 28, 35, 35, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 19, 19, 19, 19, 19, 0, 27, 0, 19, 28, 0, 28, 26, 0, 19, 19, 19, 27, 0, 25, 0, 4, 5, 5],
            [7, 7, 14, 7, 2, 2, 3, 27, 0, 0, 28, 0, 23, 28, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 37, 0, 1, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 6, 0, 0, 33, 33, 33, 33, 0, 0, 0, 28, 0, 19, 19, 28, 0, 1, 2, 2, 2, 2, 2, 2, 2, 17, 17, 17, 17, 17, 17, 17, 17, 17, 4, 17, 17, 17, 17, 32, 32, 32, 32, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 17, 17, 17, 17, 17, 17, 17, 17, 17, 4, 5, 5, 10, 7, 2, 2, 2, 7, 7, 7, 2, 2, 2, 2, 2, 2, 2, 2, 7, 7, 7, 2, 2, 2, 2, 7, 8, 5, 5],
            [8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 2, 2, 3, 17, 17, 2, 2, 17, 17, 2, 2, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 7, 2, 2, 2, 2, 3, 0, 0, 1, 2, 2, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 5, 5, 18, 18, 18, 18, 18, 18, 18, 18, 18, 12, 18, 18, 18, 18, 32, 32, 32, 32, 32, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 18, 18, 18, 18, 18, 18, 18, 18, 18, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 18, 18, 18, 18, 18, 18, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 32, 32, 32, 32, 32, 32, 0, 32, 0, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 5, 5, 5, 5, 5, 5, 6, 18, 18, 18, 18, 18, 18, 18, 18, 18, 32, 32, 32, 32, 32, 32, 32, 32, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
        ],
        
        //LEVEL 2
        [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 33, 14, 14, 33, 3, 17, 17, 0, 0, 0, 0, 0, 35, 33, 0, 0, 35, 33, 0, 30, 0, 37, 0, 0, 26, 0, 0, 0, 0, 37, 23, 0, 0, 0, 0, 0, 23, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 35, 19, 0, 13, 14, 14, 14, 14, 14, 14, 14, 7, 7, 7, 7, 7, 15, 33, 33, 13, 7, 7, 15, 0, 0, 0, 14, 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 5, 5, 5, 6, 0, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 5, 6, 0, 0, 33, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 18, 18, 0, 0, 0, 0, 0, 23, 19, 0, 0, 0, 0, 4, 5, 5, 5, 6, 35, 0, 0, 0, 13, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 14, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 32, 32, 18, 32, 32, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 4, 5, 5, 5, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 28, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 19, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 7, 14, 14, 14, 7, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 9, 9, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 13, 2, 2, 2, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 19, 0, 0, 0, 0, 1, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 0, 13, 15, 0, 0, 14, 0, 0, 4, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 22, 0, 0, 33, 0, 0, 13, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 4, 5, 5],
            [0, 24, 0, 29, 23, 23, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 21, 0, 0, 19, 1, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 27, 19, 27, 19, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 35, 35, 27, 27, 28, 33, 19, 27, 19, 28, 35, 35, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 19, 19, 19, 19, 19, 0, 27, 0, 19, 28, 0, 28, 26, 0, 19, 19, 19, 27, 0, 25, 0, 4, 5, 5],
            [7, 7, 14, 7, 2, 2, 3, 27, 0, 0, 28, 0, 23, 28, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 37, 0, 1, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 6, 0, 0, 33, 33, 33, 33, 0, 0, 0, 28, 0, 19, 19, 28, 0, 1, 2, 2, 2, 2, 2, 2, 2, 17, 17, 17, 17, 17, 17, 17, 17, 17, 4, 17, 17, 17, 17, 32, 32, 32, 32, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 17, 17, 17, 17, 17, 17, 17, 17, 17, 4, 5, 5, 10, 7, 2, 2, 2, 7, 7, 7, 2, 2, 2, 2, 2, 2, 2, 2, 7, 7, 7, 2, 2, 2, 2, 7, 8, 5, 5],
            [8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 2, 2, 3, 17, 17, 2, 2, 17, 17, 2, 2, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 7, 2, 2, 2, 2, 3, 0, 0, 1, 2, 2, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 5, 5, 18, 18, 18, 18, 18, 18, 18, 18, 18, 12, 18, 18, 18, 18, 32, 32, 32, 32, 32, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 18, 18, 18, 18, 18, 18, 18, 18, 18, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 18, 18, 18, 18, 18, 18, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 32, 32, 32, 32, 32, 32, 0, 32, 0, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 5, 5, 5, 5, 5, 5, 6, 18, 18, 18, 18, 18, 18, 18, 18, 18, 32, 32, 32, 32, 32, 32, 32, 32, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
        ]
        //LEVEL 3
        
    ]
    
    static let BuilderSet: [[[Int]]] =
    [
        [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 33, 14, 14, 33, 3, 17, 17, 0, 0, 0, 0, 0, 35, 33, 0, 0, 35, 33, 0, 30, 0, 37, 0, 0, 26, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 35, 19, 0, 13, 14, 14, 14, 14, 14, 14, 14, 7, 7, 7, 7, 7, 15, 33, 33, 13, 7, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 15, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 5, 5, 5, 6, 0, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 5, 6, 0, 0, 33, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 6, 18, 18, 18, 18, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 6, 35, 0, 0, 0, 13, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 14, 14, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 32, 32, 18, 32, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 28, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 19, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 7, 14, 14, 14, 7, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 9, 9, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 13, 2, 2, 2, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 19, 0, 0, 0, 0, 1, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 4, 5, 5],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 0, 13, 15, 0, 0, 0, 0, 0, 4, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 22, 0, 0, 33, 0, 0, 13, 14, 14, 15, 0, 0, 0, 4, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 4, 5, 5],
            [0, 24, 0, 29, 23, 23, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 21, 0, 0, 19, 1, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 27, 19, 27, 19, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 35, 35, 27, 27, 28, 33, 19, 27, 19, 28, 35, 35, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 6, 0, 20, 19, 19, 19, 19, 19, 0, 27, 0, 19, 28, 0, 28, 26, 0, 19, 19, 19, 27, 0, 25, 0, 4, 5, 5],
            [7, 7, 14, 7, 2, 2, 3, 27, 0, 0, 28, 0, 23, 28, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 37, 0, 1, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 6, 0, 0, 33, 33, 33, 33, 0, 0, 0, 28, 0, 19, 19, 28, 0, 1, 2, 2, 2, 2, 2, 2, 2, 17, 17, 17, 17, 17, 17, 17, 17, 17, 4, 17, 17, 17, 17, 32, 32, 32, 32, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 17, 17, 17, 17, 17, 17, 17, 17, 17, 4, 5, 5, 10, 7, 2, 2, 2, 7, 7, 7, 2, 2, 2, 2, 2, 2, 2, 2, 7, 7, 7, 2, 2, 2, 2, 7, 8, 5, 5],
            [8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 2, 2, 3, 17, 17, 17, 17, 17, 17, 2, 2, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 7, 2, 2, 2, 2, 3, 0, 0, 1, 2, 2, 2, 2, 2, 7, 8, 5, 5, 5, 5, 5, 5, 5, 18, 18, 18, 18, 18, 18, 18, 18, 18, 12, 18, 18, 18, 18, 32, 32, 32, 32, 32, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 18, 18, 18, 18, 18, 18, 18, 18, 18, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 18, 18, 18, 18, 18, 18, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 32, 32, 32, 32, 32, 32, 32, 0, 32, 0, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 5, 5, 5, 5, 5, 5, 6, 18, 18, 18, 18, 18, 18, 18, 18, 18, 32, 32, 32, 32, 32, 32, 32, 32, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
        ],
        [
            [5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
            [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],
            [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5],
            [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]
        ]
    ]
}
