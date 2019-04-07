//
//  Level1.swift
//  MapModule
//
//  Created by Thiago Valente on 05/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class Level1: LevelModel{
    
    let startContinuous: String
    let endContinuous: String
    let fullBlock: String
    let isInverted: Bool
    
    var map: [[String]] = [
        //["1","2","3","4","5","6","7","8","9",10",11",12",13",14",15",16",17",18",19",20",21"]
        //["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
        ["*","*","*","-","*","-","*","-","*","-","*","*","*","-","*","*","*","-","*","*","*"],
        ["-","*","-","-","*","-","*","-","-","-","*","-","*","-","*","-","-","-","*","-","*"],
        ["-","*","-","-","*","*","*","-","*","-","*","*","*","-","*","-","-","-","*","-","*"],
        ["-","*","-","-","*","-","*","-","*","-","*","-","*","-","*","-","*","-","*","-","*"],
        ["-","*","-","-","*","-","*","-","*","-","*","-","*","-","*","*","*","-","*","*","*"],
        ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
        ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
        ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
        ["<","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x",">"],
    ]
    
    
    init() {
        self.startContinuous = "<"
        self.endContinuous = ">"
        self.fullBlock = "*"
        self.isInverted = true
    }
    
    
    func spriteImageType(name type: String) -> UIImage? {
        switch type {
        case "<":
            return #imageLiteral(resourceName: "stone_brick_block_ground_01")
        case "x":
            return #imageLiteral(resourceName: "stone_brick_block_ground_02")
        case ">":
            return #imageLiteral(resourceName: "stone_brick_block_ground_03")
        case "*":
            return #imageLiteral(resourceName: "stone_brick_block_wall")
        default:
            return nil
        }
    }
    
    func reverse(){
        self.map.reverse()
    }
}
