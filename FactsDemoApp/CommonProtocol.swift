//
//  CommonProtocol.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

// MARK: - Generic Configurable
/// Generic Configurable Protocol.
/// Mostly useful for binding different types of ViewModels to the ViewController
protocol Configurable {
    /// Generic Type
    associatedtype T
    /// Binds generic model to the conforming class
    ///
    /// - Parameters:
    ///   - model: generic type model
    func bind(to model: T)
}
