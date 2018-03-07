//
//  ViewController.swift
//  sprite
//
//  Created by Caleb Wells on 3/3/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SKView()
    }
    
    var skView: SKView {
        return view as! SKView
    }
    
    let scene = SKScene(size: CGSize(width: 1125, height: 2436)) // iPhone X
    
    override func viewWillAppear(_ animated: Bool) {
        skView.presentScene(scene)
        scene.backgroundColor = UIColor(red: 102/255, green: 210/255, blue: 255/255, alpha: 1.0)
        
        let two = SKSpriteNode(imageNamed: "201")
        two.size = CGSize(width: 300, height: 300)
        two.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        scene.addChild(two)
        
    }
}

