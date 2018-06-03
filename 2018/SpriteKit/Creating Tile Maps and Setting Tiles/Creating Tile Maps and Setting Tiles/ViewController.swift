//
//  ViewController.swift
//  Creating Tile Maps and Setting Tiles
//
//  Created by Caleb Wells on 6/2/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    let scene = SKScene(size: CGSize(width: 1125, height: 2436)) // iPhone X

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = SKView()
    }
    
    var skView: SKView {
        return view as! SKView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        skView.presentScene(scene)
        scene.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
    }
    
    func createTileMap() {
        // Create Tile Maps and Setting Tiles
        
        // Get the tile map
        guard let tileSet = SKTileSet(named: "TileSet") else { return }
        
        // Create a tile map
        let tileSize = CGSize(width: 32.0, height: 32.0)
        let tileMap = SKTileMapNode(tileSet: tileSet, columns: 16, rows: 16, tileSize: tileSize)
        
        // Get a tile group from the tile set
        let tileGroup = tileSet.tileGroups.first
        
        // Set tile group for a specific tile
        tileMap.setTileGroup(tileGroup, forColumn: 4, row: 7)
        
        // Fill the entire map with a tile group
        tileMap.fill(with: tileGroup)
        
    }
}

