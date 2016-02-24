//
//  UIControl+Extensions.swift
//  SwiftTargetActions
//
//  Created by Bradley Hilton on 2/23/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import UIKit

public protocol ControlClosure {}

extension ControlClosure where Self : UIControl {
    
    public typealias ControlCallback = (sender: Self) -> ()
    
    public func controlEvents(events: UIControlEvents, callback: ControlCallback) {
        let target = Target(callback: callback)
        addTarget(target, action: target.action, forControlEvents: events)
        objc_setAssociatedObject(self, target.key, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
}

extension UIControl : ControlClosure {}
