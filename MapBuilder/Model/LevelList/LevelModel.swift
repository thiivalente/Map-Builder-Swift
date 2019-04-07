//
//  LevelModel.swift
//  MapModule
//
//  Created by Thiago Valente on 05/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

/*
==== Name Types ====
  < = Start ground
  x = Ground
  > = End ground
  * = Complete ground
  + = Complete Ground + Coin
  o = Complete Ground + SpawnArea
  - = None
====================
*/

protocol LevelModel{
    
    var startContinuous: String {get}
    var endContinuous: String {get}
    var fullBlock: String {get}
    
    /// Need be seted to true when want show the map in same direction of the created map
    var isInverted: Bool{get}
    
    /// Is the multi-dimensional array responsable for construct in code the map
    var map: [[String]]{get set}
    
    /// Will called by the LevelBuilder to get the name of sprite block to show on scene based on the name type
    ///
    /// - Parameter type: The name type need be a valid string name type or will not show any sprite
    func spriteImageType(name type: String) -> UIImage?
    
    /// When the map is inverted the LevelBuilder use this function to reverse the array
    func reverse()
}
