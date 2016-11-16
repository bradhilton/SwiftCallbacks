//
//  Target.swift
//  SwiftTargetActions
//
//  Created by Bradley Hilton on 2/23/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import UIKit

class Target<T> : NSObject {
    
    typealias Callback = (T) -> ()
    
    let callback: Callback
    
    var action: Selector {
        return #selector(invoke(sender:))
    }
    
    init(callback: @escaping Callback) {
        self.callback = callback
    }
    
    init?(callback: Callback?) {
        guard let callback = callback else { return nil }
        self.callback = callback
    }
    
    func invoke(sender: AnyObject) {
        if let sender = sender as? T {
            callback(sender)
        }
    }
    
}
