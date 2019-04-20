//
//  GameScene.swift
//  Night Five
//
//  Created by Caleb Wells on 4/19/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var label: SKLabelNode?
    var scoreNumber = 0
    
    var player = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        
        self.player = (self.childNode(withName: "player") as? SKSpriteNode)!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Hello touch")
        
        let jump = SKAction.move(by: CGVector(dx: 12, dy: 720), duration: 0.5)
        player.run(jump)
        
        scoreNumber += 1
        
        label?.text = "Score: \(scoreNumber)"
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
