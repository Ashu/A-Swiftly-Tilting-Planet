//
//  GameScene.swift
//  Night Six
//
//  Created by Caleb Wells on 4/26/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var label: SKLabelNode?
    private var player = SKSpriteNode()
    
    var scoreNumber = 0
    
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        
        self.player = self.childNode(withName: "Player") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Hello touch")
        
        let jump = SKAction.move(by: CGVector(dx: 0, dy: 380), duration: 0.5)
        player.run(jump)
        
        scoreNumber += 1
        
        label?.text = "Score: \(scoreNumber)"
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
