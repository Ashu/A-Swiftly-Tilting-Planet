//
//  GameScene.swift
//  Whack-a-Egg
//
//  Created by Caleb Wells on 3/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import SpriteKit
import GameplayKit

var gameScore: SKLabelNode!
var score = 0 {
    didSet {
        gameScore.text = "Score: \(score)"
    }
}
var numberOfRounds = 0

class GameScene: SKScene {
    
    var popupTime = 0.85
    
    var slots = [WhackSlot]()
    
    override func didMove(to view: SKView) {
        
        if let musicURL = Bundle.main.url(forResource: "happy", withExtension: "mp3") {
            let backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
        
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
        
        for i in 0 ..< 2 { createSlot(at: CGPoint(x: 200 + (i * 350), y: 800)) }
        for i in 0 ..< 3 { createSlot(at: CGPoint(x: 872 + (i * 320), y: 687)) }
        for i in 0 ..< 1 { createSlot(at: CGPoint(x: 1870 + (i * 320), y: 800)) }
        for i in 0 ..< 2 { createSlot(at: CGPoint(x: 2180 + (i * 320), y: 880)) }
        
        if numberOfRounds < 28 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
                self.createEnemy()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let tappedNodes = nodes(at: location)
            
            for node in tappedNodes {
                if node.name == "charFriend" {
                    let whackSlot = node.parent!.parent as! WhackSlot
                    if !whackSlot.isVisible { continue }
                    if whackSlot.isHit { continue }
                    
                    whackSlot.hit()
                    
                    if score >= 1 {
                        score -= 5
                    } else if score <= 0 {
                        score = 0
                    }
                    
                    //run(SKAction.playSoundFileNamed("", waitForCompletion: false))
                } else if node.name == "charEnemy" {
                    let whackSlot = node.parent!.parent as! WhackSlot
                    if !whackSlot.isVisible { continue }
                    if whackSlot.isHit { continue }
                    
                    whackSlot.charNode.xScale = 0.85
                    whackSlot.charNode.yScale = 0.85
                    
                    whackSlot.hit()
                    score += 5
                    
                    //run(SKAction.playSoundFileNamed("", waitForCompletion: false))
                }
            }
            
        }
    }
    
    func createSlot(at position: CGPoint) {
        let slot = WhackSlot()
        slot.configure(at: position)
        addChild(slot)
        slots.append(slot)
    }
    
    func createEnemy() {
        numberOfRounds += 1
        popupTime *= 0.991
        
        slots = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: slots) as! [WhackSlot]
        slots[0].show(hideTime: popupTime)
        
        if RandomInt(min: 0, max: 12) > 4 { slots[1].show(hideTime: popupTime) }
        if RandomInt(min: 0, max: 12) > 8 { slots[2].show(hideTime: popupTime) }
        if RandomInt(min: 0, max: 12) > 10 { slots[3].show(hideTime: popupTime) }
        if RandomInt(min: 0, max: 12) > 11 { slots[4].show(hideTime: popupTime) }
        
        let minDelay = popupTime / 2.0
        let maxDelay = popupTime * 2
        let delay = RandomDouble(min: minDelay, max: maxDelay)
        
        if numberOfRounds < 30 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [unowned self] in
                self.createEnemy()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if numberOfRounds >= 30 {
            numberOfRounds = 0
            cleanUpScene()
            
            if let scene = SKScene(fileNamed: "GameOver") {
                scene.scaleMode = .aspectFill
                view?.presentScene(scene)
            }
        }
    }
    
    func cleanUpScene() {
        if let recognizers = self.view!.gestureRecognizers {
            for recognizer in recognizers {
                self.view!.removeGestureRecognizer(recognizer)
            }
        }
        
        self.removeAllActions()
        
        for node in self.children {
            node.removeAllActions()
        }
    }
}
