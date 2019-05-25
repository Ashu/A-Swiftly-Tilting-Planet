//
//  TodayViewController.swift
//  Widget
//
//  Created by Caleb Wells on 5/23/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit
import NotificationCenter

@objc(TodayViewController)
class TodayViewController: UITableViewController, NCWidgetProviding {
        
    let id = "id"
    
    var list = ["Steve", "Tim", "Bob"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: id)

        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.font = .boldSystemFont(ofSize: 27)

        cell.detailTextLabel?.text = "Some detail text for testing the detail taxt label in the table view cell."
        cell.detailTextLabel?.numberOfLines = 3

        return cell
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 300)
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
}
