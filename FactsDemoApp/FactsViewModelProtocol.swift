//
//  FactsViewModelProtocol.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

protocol FactsViewModelProtocol {
    var title: DynamicValue<String> { get }
    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
}
