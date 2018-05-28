//
//  HeaderView.swift
//  Tiny View Controllers
//
//  Created by Caleb Wells on 5/27/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    func createSubviews() {
        // all the layout code from above
    }
}
