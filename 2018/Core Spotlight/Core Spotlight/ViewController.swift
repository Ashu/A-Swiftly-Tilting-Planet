//
//  ViewController.swift
//  Core Spotlight
//
//  Created by Caleb Wells on 5/25/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeData as String)
        attributeSet.title = "Document Report"
        attributeSet.contentDescription = "Document"
        
        let item = CSSearchableItem(uniqueIdentifier: "1", domainIdentifier: "file-1", attributeSet: attributeSet)
        
        CSSearchableIndex.default().indexSearchableItems([item]) { error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else {
                print("Item indexed.")
            }
        }
    }
}

