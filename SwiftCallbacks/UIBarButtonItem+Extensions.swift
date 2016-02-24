//
//  UIBarButtonItem+Extensions.swift
//  SwiftTargetActions
//
//  Created by Bradley Hilton on 2/23/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

protocol UIBarButtonItemClosureProtocol {}

extension UIBarButtonItem {
    
    public typealias BarButtonItemCallback = (sender: UIBarButtonItem) -> ()
    
    public convenience init(image: UIImage?, style: UIBarButtonItemStyle, callback: BarButtonItemCallback?) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.callback = callback
    }
    public convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: UIBarButtonItemStyle, callback: BarButtonItemCallback?) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: nil, action: nil)
        self.callback = callback
    }
    
    public convenience init(title: String?, style: UIBarButtonItemStyle, callback: BarButtonItemCallback?) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.callback = callback
    }
    
    public convenience init(barButtonSystemItem systemItem: UIBarButtonSystemItem, callback: BarButtonItemCallback?) {
        self.init(barButtonSystemItem: systemItem, target: nil, action: nil)
        self.callback = callback
    }
    
    public var callback: BarButtonItemCallback? {
        get {
            guard let target: Target<UIBarButtonItem> = getAssociatedValueForProperty("target", ofObject: self) else { return nil }
            return target.callback
        }
        set {
            let target = Target(callback: newValue)
            self.target = target
            self.action = target?.action ?? nil
            setAssociatedValue(target, forProperty: "target", ofObject: self)
        }
    }
    
}

