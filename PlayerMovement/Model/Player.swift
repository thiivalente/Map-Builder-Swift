//
//  Player.swift
//  PlayerMovement
//
//  Created by Thiago Valente on 03/04/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import SpriteKit

class Player: SKShapeNode {
    
    var hasRect = CGRect(x: 0, y: 0, width: 50, height: 50)
    
    // Object Property
    var velocity : CGFloat = 15
    var jumpForce: CGFloat = 15
    
    /// Init player
    ///
    /// - Parameter position: Optional position to set object in scene
    init(position: CGPoint? = CGPoint(x: 0, y: 0), size: CGSize){
        super.init()
        // Necessary to create a ShapeNode - Retangle
        let rect = CGRect(x: position!.x, y: position!.y, width: size.width, height: size.height)
        self.hasRect = rect
        self.path = UIBezierPath(roundedRect: rect, cornerRadius: 0).cgPath
        self.position = position!
        self.fillColor = UIColor.random()
        self.configurePhysicsBody()
        self.velocity = size.width/2
        self.jumpForce = size.width/2
    }
    
    /// Configure physics from player
    func configurePhysicsBody() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.hasRect.size, center: CGPoint(x: self.hasRect.midX, y: self.hasRect.midY))
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.friction = 0
        self.physicsBody!.restitution = 0
        self.physicsBody!.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Function called to move the player
    ///
    /// - Parameter dx: value of joystick side to move the object, necessary to know the side
    func move(inDirectionX dx: CGFloat) {
        let nodeDirection: CGFloat = dx < 0 ? -1.0 : 1.0
        self.physicsBody?.velocity.dx = 0.0
        self.physicsBody?.applyImpulse(CGVector(dx: (velocity*nodeDirection), dy: 0))
    }
    
    /// Action to jump player
    func jump(){
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.velocity.dy = 0
        self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpForce))
        self.physicsBody?.affectedByGravity = true
    }
    
    /// Remove velocity to idle player
    func idle(){
        self.physicsBody?.velocity.dx = 0
    }
}
