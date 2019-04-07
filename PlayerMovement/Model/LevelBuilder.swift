//
//  Map.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 05/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import SpriteKit

class LevelBuilder{
    let scene: SKScene
    let lenght : CGFloat = 21
    let blockSize : CGFloat
    
    init(scene: SKScene){
        self.scene = scene
        self.blockSize = scene.frame.width/lenght
    }
    
    /// Will construct the map based on LevelModel
    func construct(levelModel: LevelModel? = nil){
        // Get the level model received by the scene or the level will be selected randomly if both nil stops construct.
        guard let level = levelModel == nil ? self.chooseRandomLevel() : levelModel else { return }
        // Check if the way it was mounted is unlike how an array is read
        if level.isInverted{
            level.reverse()
        }
        // Run the map to put on screen
        for i in 0..<level.map.count {
            let positionY = CGFloat(i)*blockSize + (blockSize/2)
            
            // These variables are necessary to create a single physicsBody on continuous mode
            var startContinuous: CGFloat? = nil
            var endContinuous: CGFloat? = nil
            // Run each line of the array-map
            for (i,block) in level.map[i].enumerated(){
                // Position of the block on screen
                let position = CGPoint(x: CGFloat(i)*blockSize+(blockSize/2), y: positionY)
                
                // Check type of current block to set PhysicsBody
                if block == level.startContinuous{
                    startContinuous = CGFloat(i)
                }else if block == level.endContinuous{
                    endContinuous = CGFloat(i)
                }else if block == level.fullBlock{
                    startContinuous = CGFloat(i)
                    endContinuous = CGFloat(i)
                }
                
                // Check if these name really exists on this map
                guard let image = level.spriteImageType(name: block) else { continue }
                let texture = SKTexture(image: image)
                let size = CGSize(width: blockSize, height: blockSize)
                let blockSprite = SKSpriteNode(texture: texture, size: size)
                blockSprite.position = position
                self.scene.addChild(blockSprite)
                
                // To add physicsBody is necessary the Start and the End of blocks.
                guard let start = startContinuous, let end = endContinuous else { continue }
                let width = end <= start ? 0 : (end-start)*blockSize
                let rect = CGRect(x: CGFloat(start)*blockSize, y: positionY - blockSize/2, width: width+blockSize, height: blockSize)
                let nodePhysics = SKShapeNode(rect: rect)
                nodePhysics.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
                nodePhysics.physicsBody?.isDynamic = false
                nodePhysics.physicsBody?.restitution = 0
                nodePhysics.physicsBody?.friction = 0
                self.scene.addChild(nodePhysics)
                
                // When seted the physics clear the properties-continuous
                startContinuous = nil
                endContinuous = nil
                
            }
        }
    }
    
    /// Instance the list of maps and select a random map
    ///
    /// - Returns: Returns the randomly selected level or nil if no level exists.
    private func chooseRandomLevel() -> LevelModel?{
        return LevelList.levels().randomElement()
    }
    
}
