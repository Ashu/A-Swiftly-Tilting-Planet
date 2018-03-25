//
//  WhackSlot.swift
//  Whack-a-Egg
//
//  Created by Caleb Wells on 3/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import SpriteKit

class WhackSlot: SKNode {
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackBasket")
        addChild(sprite)
    }
}
