//
//  Map.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 05/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import SpriteKit

class LevelBuilderExample{
    let scene: SKScene
    let lenght : CGFloat = 21
    let blockSize : CGFloat
    
    init(scene: SKScene){
        self.scene = scene
        self.blockSize = scene.frame.width*(1/lenght)
    }
    
//    var map1 = [
//        ["<","x","x","x","x","x","x","x","x","x",">"],
//        ["-","-","-","-","-","-","-","-","-","-","-"],
//        ["-","-","-","<","x","x",">","-","-","-","-"]
//    ]
    
    // Map - variables
//    var isInverted: Bool = false
//    var map1 = [
//       //["1","2","3","4","5","6","7","8","9",10",11",12",13",14",15",16",17",18",19",20",21"]
//       //["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
//         ["<","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x",">"],
//         ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
//         ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
//         ["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
//         ["-","*","-","-","*","-","*","-","*","-","*","-","*","-","*","*","*","-","*","*","*"],
//         ["-","*","-","-","*","-","*","-","*","-","*","-","*","-","*","-","*","-","*","-","*"],
//         ["-","*","-","-","*","*","*","-","*","-","*","*","*","-","*","-","*","-","*","-","*"],
//         ["-","*","-","-","*","-","*","-","-","-","*","-","*","-","*","-","-","-","*","-","*"],
//         ["*","*","*","-","*","-","*","-","*","-","*","*","*","-","*","*","*","-","*","*","*"],
//    ]
    var isInverted: Bool = true
    var map1 = [
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

    
    func construct(){
        if self.isInverted{
            self.map1.reverse()
        }
        for i in 0..<map1.count {
            let positionY = CGFloat(i)*blockSize
            var startIndex: CGFloat? = nil
            var endIndex: CGFloat? = nil
            for (i,block) in map1[i].enumerated(){
                let position = CGPoint(x: CGFloat(i)*blockSize+(blockSize/2), y: positionY)
                var spriteName = ""
                
                switch block{
                case "<":
                    spriteName = "stone_brick_block_ground_01"
                    startIndex = CGFloat(i)
                case "x":
                    spriteName = "stone_brick_block_ground_02"
                case ">":
                    spriteName = "stone_brick_block_ground_03"
                    endIndex = CGFloat(i)
                case "*":
                    spriteName = "stone_brick_block_wall"
                    startIndex = CGFloat(i)
                    endIndex = CGFloat(i)
                default:
                    continue
                }
                
                let texture = SKTexture(imageNamed: spriteName)
                let size = CGSize(width: blockSize, height: blockSize)
                let blockSprite = SKSpriteNode(texture: texture, size: size)
                blockSprite.position = position
                self.scene.addChild(blockSprite)
                
                guard let start = startIndex, let end = endIndex else { continue }
                let width = end <= start ? 0 : (end-start)*blockSize
                let rect = CGRect(x: CGFloat(start)*blockSize, y: positionY - blockSize/2, width: width+blockSize, height: blockSize)
                let nodePhysics = SKShapeNode(rect: rect)
                nodePhysics.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
                nodePhysics.physicsBody?.isDynamic = false
                nodePhysics.physicsBody?.restitution = 0
                nodePhysics.physicsBody?.friction = 0
                self.scene.addChild(nodePhysics)
                
                startIndex = nil
                endIndex = nil
                
            }
        }
    }
    
}
