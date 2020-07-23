//
//  NSObject+Dynamic.swift
//  FactsDemoApp
//
//  Created by Gaurav Nigam on 21/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

extension NSObject {
    func observe<T>(for observables: [DynamicValue<T>], with: @escaping () -> Void) {
        for observable in observables {
            if let observer = observable as? NSObject {
                observable.addAndNotify(observer: observer) {
                    DispatchQueue.main.async {
                        with()
                    }
                }
            }
        }
    }
    
    func observe<T>(for observable: DynamicValue<T>?, with: @escaping () -> Void) {
        if let observer = observable as? NSObject {
            observable?.addAndNotify(observer: observer, completionHandler: {
                DispatchQueue.main.async {
                    with()
                }
            })
        }
    }
}
