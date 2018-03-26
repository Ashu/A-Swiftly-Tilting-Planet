//
//  GameScene.swift
//  Whack-a-Egg
//
//  Created by Caleb Wells on 3/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import SpriteKit
import GameKit
import GameplayKit

class GameScene: SKScene, GKGameCenterControllerDelegate {
    
    //Whack-a-Egg-Best
    let leaderboardID = "Whack-a-Egg-Best"
    
    var popupTime = 0.85
    var numberOfRounds = 0
    
    var slots = [WhackSlot]()
    
    var gameScore: SKLabelNode!
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        authenticateWithGameCenter()
        
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.createEnemy()
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
                
                if node.name == "GC" {
                    openGameCenter()
                }
            }
            
        }
        
        if numberOfRounds >= 30 {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view?.presentScene(scene)
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
        
        if numberOfRounds >= 30 {
            for slot in slots {
                slot.hide()
            }
            
            let gameOver = SKLabelNode(fontNamed: "GillSans-UltraBold")
            gameOver.text = "Game Over"
            gameOver.position = CGPoint(x: 480, y: 1250)
            gameOver.horizontalAlignmentMode = .left
            gameOver.fontColor = UIColor(red: 72/255, green: 126/255, blue: 29/255, alpha: 1.0)
            gameOver.fontSize = 272
            addChild(gameOver)
            
            let gc = SKLabelNode(fontNamed: "GillSans-UltraBold")
            gc.text = "Game Center"
            gc.position = CGPoint(x: 480, y: 1000)
            gc.horizontalAlignmentMode = .left
            gc.fontColor = .black
            gc.fontSize = 172
            gc.name = "GC"
            addChild(gc)
            
            return
        }
        
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [unowned self] in
            self.createEnemy()
        }
    }
    
    // MARK: === Game Center code
    var gkEnabled = Bool()
    var gkDefaultLeaderBoardID = String()
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func authenticateWithGameCenter() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if (ViewController) != nil {
                let vc: UIViewController = self.view!.window!.rootViewController!
                vc.present(ViewController!, animated: true, completion: nil)
            } else if localPlayer.isAuthenticated {
                self.gkEnabled = true
                
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: {(leaderboardID, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        self.gkDefaultLeaderBoardID = leaderboardID!
                    }
                })
            } else {
                self.gkEnabled = false
                print(error!)
            }
        }
    }
    
    func submitScoreToGC() {
        
        // submit score to Game Center
        let bestScore = GKScore(leaderboardIdentifier: leaderboardID)
        bestScore.value = Int64(score)
        GKScore.report([bestScore]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                // code?
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        submitScoreToGC()
    }
    
    func openGameCenter() {
        
        let gameCenterViewController = GKGameCenterViewController()
        gameCenterViewController.gameCenterDelegate = self
        
        let vc: UIViewController = self.view!.window!.rootViewController!
        vc.present(gameCenterViewController, animated: true, completion: nil)
    }
}
