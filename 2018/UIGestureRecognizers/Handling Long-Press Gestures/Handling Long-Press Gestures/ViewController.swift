//
//  ViewController.swift
//  Handling Long-Press Gestures
//
//  Created by Caleb Wells on 3/19/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "coffee"))
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        imageView.addGestureRecognizer(longPress)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let menu = UIMenuController.shared
            becomeFirstResponder()
            
            let menuCrop = UIMenuItem(title: "Crop", action: #selector(handleMenuItemAction))
            let menuRotate = UIMenuItem(title: "Rotate", action: #selector(handleMenuItemAction))
            let menuContrast = UIMenuItem(title: "Contrast", action: #selector(handleMenuItemAction))
            let menuVibrance = UIMenuItem(title: "Vibrance", action: #selector(handleMenuItemAction))
            menu.menuItems = [menuCrop, menuRotate, menuContrast, menuVibrance]
            
            let location = sender.location(in: sender.view)
            let menuLocation = CGRect(x: location.x, y: location.y, width: 0, height: 0)
            menu.setTargetRect(menuLocation, in: sender.view!)
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    @objc func handleMenuItemAction() {
        print("handled menu item action!!")
    }
}

