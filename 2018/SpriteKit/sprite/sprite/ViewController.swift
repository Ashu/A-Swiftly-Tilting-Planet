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
    
    let scene = SKScene(size: CGSize(width: 1920, height: 1080))
    
    override func viewWillAppear(_ animated: Bool) {
        skView.presentScene(scene)
        
        let hello = SKLabelNode(text: "Hello, SpriteKit")
        hello.fontSize = 127
        hello.fontColor = .red
        hello.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        scene.addChild(hello)
        
    }
}

