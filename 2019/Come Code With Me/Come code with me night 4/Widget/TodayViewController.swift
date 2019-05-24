//
//  TodayViewController.swift
//  Widget
//
//  Created by Caleb Wells on 5/23/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit
import NotificationCenter

@objc
class TodayViewController: UIViewController, NCWidgetProviding {
        
    let id = "id"
    
    var list = ["Steve", "Tim"]
    
//    override func loadView() {
//        view = UIView(frame:CGRect(x: 0.0, y: 0, width: 320.0, height: 200.0))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSize(width: 0, height: 200)
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
