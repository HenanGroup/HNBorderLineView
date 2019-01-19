//
//  ViewController.swift
//  HNBorderLineView
//
//  Created by 伟坤 郭 on 01/19/2019.
//  Copyright (c) 2019 伟坤 郭. All rights reserved.
//

import UIKit
import HNBorderLineView

class ViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.addSeparatorLines([.top, .bottom, .left, .right, .centerY, .centerX]) { (v, diction) in
            v.defaultConfig.color = .red
            v.defaultConfig.height = 2.0
            v.defaultConfig.insets = SeparatorInsets(frond: 10, back: 20)
        }
    }
}

