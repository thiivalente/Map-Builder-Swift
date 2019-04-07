//
//  GameScene.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 03/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gesturePad: GesturePad!
    var player: Player!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        // Gesture to move
        self.configureGesturePad(for: view)
        
        // Test map
        let map = LevelBuilder(scene: self)
        map.construct()
        
        self.player = Player(position: CGPoint(x: 0, y: 150), size: CGSize(width: map.blockSize-5, height: map.blockSize-5))
        self.addChild(self.player)

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func configureGesturePad(for view: SKView) {
        guard let view = self.view else { return }
        self.gesturePad = GesturePad(forView: view)
        self.gesturePad.delegate = self
    }
    
}

extension GameScene: GesturePadDelegate {
    // Left side to move
    func performActionForAnalogMoving(inAngle angle: CGFloat, withDirectionX dx: CGFloat, AndDirectionY dy: CGFloat) {
        self.player.move(inDirectionX: dx)
    }
    
    // When stop move
    func performActionForAnalogStopMoving() {
        self.player.idle()
    }
    
    // Right side tap 
    func performActionForTap() {
        self.player.jump()
    }
    
    func performActionForSwipeUp() {
        //
    }
    
    func performActionForSwipeDown() {
        //
    }
}
