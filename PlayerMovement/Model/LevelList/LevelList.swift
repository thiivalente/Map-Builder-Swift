//
//  LevelList.swift
//  MapModule
//
//  Created by Thiago Valente on 05/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

class LevelList{
    
    /// Function called to know the list of level
    ///
    /// - Returns: array of level list, can be empty
    static func levels() -> [LevelModel]{
        return [
            Level1(),
            Level2(),
        ]
    }
    
}
