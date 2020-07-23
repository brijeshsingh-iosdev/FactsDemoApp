//
//  ErrorResult.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
