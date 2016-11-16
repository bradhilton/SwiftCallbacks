//
//  UIBarButtonItem+Extensions.swift
//  SwiftTargetActions
//
//  Created by Bradley Hilton on 2/23/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import UIKit
import AssociatedValues

extension UIBarButtonItem {
    
    public typealias Callback = (_ sender: UIBarButtonItem) -> ()
    
    public convenience init(image: UIImage?, style: UIBarButtonItemStyle, callback: Callback?) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.callback = callback
    }
    public convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: UIBarButtonItemStyle, callback: Callback?) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: nil, action: nil)
        self.callback = callback
    }
    
    public convenience init(title: String?, style: UIBarButtonItemStyle, callback: Callback?) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.callback = callback
    }
    
    public convenience init(barButtonSystemItem systemItem: UIBarButtonSystemItem, callback: Callback?) {
        self.init(barButtonSystemItem: systemItem, target: nil, action: nil)
        self.callback = callback
    }
    
    public var callback: Callback? {
        get {
            guard let target: Target<UIBarButtonItem> = getAssociatedValue(key: "target", object: self) else { return nil }
            return target.callback
        }
        set {
            let target = Target(callback: newValue)
            self.target = target
            self.action = target?.action ?? nil
            set(associatedValue: target, key: "target", object: self)
        }
    }
    
}

