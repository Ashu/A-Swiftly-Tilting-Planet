//
//  WhackSlot.swift
//  Whack-a-Egg
//
//  Created by Caleb Wells on 3/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import SpriteKit

class WhackSlot: SKNode {
    
    var isVisible = false
    var isHit = false
    
    var charNode: SKSpriteNode!
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackBasket")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 100)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "egg")
        charNode.position = CGPoint(x: 0, y: -227)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
    
    func show(hideTime: Double) {
        if isVisible { return }
        
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.run(SKAction.moveBy(x: 0, y: 120, duration: 0.05))
        isVisible = true
        isHit = false
        
        if RandomInt(min: 0, max: 2) == 0 {
            charNode.texture = SKTexture(imageNamed: "egg")
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "badEgg")
            charNode.name = "charEnemy"
        }
        
        if numberOfRounds < 20 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)) { [unowned self] in
                self.hide()
            }
        }
    }
    
    func hide() {
        if !isVisible { return }
        
        charNode.run(SKAction.moveBy(x: 0, y: -120, duration: 0.05))
        isVisible = false
    }
    
    func hit() {
        isHit = true
        
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -120, duration: 0.5)
        let notVisible = SKAction.run { [unowned self] in self.isVisible = false }
        charNode.run(SKAction.sequence([delay, hide, notVisible]))
    }
}
