//
//  Target.swift
//  SwiftTargetActions
//
//  Created by Bradley Hilton on 2/23/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

class Target<T> : NSObject {
    
    typealias Callback = T -> ()
    
    let callback: Callback
    
    var action: Selector {
        return "invoke:"
    }
    
    let key: UnsafePointer<Void>
    
    init(callback: Callback) {
        self.callback = callback
        self.key = pointer.advance()
    }
    
    convenience init?(callback: Callback?) {
        if let callback = callback {
            self.init(callback: callback)
        } else {
            self.init(callback: { _ in })
            return nil
        }
    }
    
    func invoke(sender: AnyObject) {
        if let sender = sender as? T {
            callback(sender)
        }
    }
    
}

extension UnsafePointer {
    
    private mutating func advance() -> UnsafePointer {
        self = self.advancedBy(1)
        return self
    }
    
}

private var pointer = UnsafePointer<Void>()
