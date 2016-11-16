//
//  UIControl+Extensions.swift
//  SwiftTargetActions
//
//  Created by Bradley Hilton on 2/23/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import UIKit
import AssociatedValues

public protocol ControlClosure {}

extension ControlClosure where Self : UIControl {
    
    public typealias ControlCallback = (_ sender: Self) -> ()
    
    public func controlEvents(_ events: UIControlEvents, callback: @escaping ControlCallback) {
        let target = Target(callback: callback)
        addTarget(target, action: target.action, for: events)
        set(associatedValue: target, key: NSUUID().uuidString, object: self)
    }
    
}

extension UIControl : ControlClosure {}
