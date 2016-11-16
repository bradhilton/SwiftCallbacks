//
//  ViewController.swift
//  Example
//
//  Created by Bradley Hilton on 11/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import UIKit
import SwiftCallbacks

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 60, width: 100, height: 44)
        button.setTitle("Button", for: .normal)
        button.controlEvents(.touchUpInside) { _ in
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Item", style: .plain) { _ in
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Second Item", style: .plain, callback: nil)
            }
        }
        view.addSubview(button)
    }

}

