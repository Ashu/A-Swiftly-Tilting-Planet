//
//  GameOver.swift
//  Whack-a-Egg
//
//  Created by Caleb Wells on 3/26/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import SpriteKit
import GameKit
import StoreKit

class GameOver: SKScene, GKGameCenterControllerDelegate {
    
    let leaderboardID = "Whack-a-Egg-Best"
    
    override func didMove(to view: SKView) {
        authenticateWithGameCenter()
        
        showReview()
        incrementAppRuns()
        
        let gameOver = SKLabelNode(fontNamed: "GillSans-UltraBold")
        gameOver.text = "Game Over"
        gameOver.position = CGPoint(x: 480, y: 1250)
        gameOver.horizontalAlignmentMode = .left
        gameOver.fontColor = UIColor(red: 72/255, green: 126/255, blue: 29/255, alpha: 1.0)
        gameOver.fontSize = 272
        addChild(gameOver)
        
        let gc = SKLabelNode(fontNamed: "GillSans-UltraBold")
        gc.text = "Game Center"
        gc.position = CGPoint(x: 1600, y: 450)
        gc.horizontalAlignmentMode = .left
        gc.fontColor = .white
        gc.fontSize = 127
        gc.name = "GC"
        addChild(gc)
        
        let play = SKLabelNode(fontNamed: "GillSans-UltraBold")
        play.text = "Play"
        play.position = CGPoint(x: 250, y: 450)
        play.horizontalAlignmentMode = .left
        play.fontColor = .white
        play.fontSize = 127
        play.name = "Play"
        addChild(play)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let tappedNodes = nodes(at: location)
            
            for node in tappedNodes {
                if node.name == "Play" {
                    cleanUpScene()
                    
                    score = 0
                    
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFill
                        view?.presentScene(scene)
                    }
                } else if node.name == "GC" {
                    openGameCenter()
                }
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
    
    // MARK: === Request a review.
    let runIncrementerSetting = "numberOfRuns"
    let minimumRunCount = 3
    
    func incrementAppRuns() {
        
        let usD = UserDefaults()
        let runs = getRunCounts() + 1
        usD.setValuesForKeys([runIncrementerSetting: runs])
        usD.synchronize()
        
    }
    
    func getRunCounts () -> Int {
        let usD = UserDefaults()
        let savedRuns = usD.value(forKey: runIncrementerSetting)
        
        var runs = 0
        if savedRuns != nil {
            
            runs = savedRuns as! Int
        }
        
        print("Run Counts are \(runs)")
        return runs
        
    }
    
    func showReview() {
        
        let runs = getRunCounts()
        print("Show Review")
        
        if runs == minimumRunCount {
            print("Review Requested")
            SKStoreReviewController.requestReview()
        }
    }
}

