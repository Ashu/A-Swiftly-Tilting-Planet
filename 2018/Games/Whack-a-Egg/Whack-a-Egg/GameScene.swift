//
//  GameScene.swift
//  Whack-a-Egg
//
//  Created by Caleb Wells on 3/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var slots = [WhackSlot]()
    
    var gameScore: SKLabelNode!
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "whackBackground")
        background.position = CGPoint(x: 1366, y: 1024)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        gameScore = SKLabelNode(fontNamed: "GillSans-UltraBold")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: 72, y: 1880)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontColor = UIColor(red: 72/255, green: 126/255, blue: 29/255, alpha: 1.0)
        gameScore.fontSize = 72
        addChild(gameScore)
        
        for i in 0 ..< 2 { createSlot(at: CGPoint(x: 150 + (i * 372), y: 800)) }
        for i in 0 ..< 3 { createSlot(at: CGPoint(x: 872 + (i * 372), y: 687)) }
        for i in 0 ..< 2 { createSlot(at: CGPoint(x: 2000 + (i * 372), y: 772)) }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func createSlot(at position: CGPoint) {
        let slot = WhackSlot()
        slot.configure(at: position)
        addChild(slot)
        slots.append(slot)
    }
}
