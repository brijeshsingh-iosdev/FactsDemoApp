//
//  FactsViewModel.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import UIKit

class FactsViewModel: NSObject, FactsViewModelProtocol {    

    weak var dataSource: GenericDataSource<FactModel>?
    var error: DynamicValue<ErrorResult> = DynamicValue()
    var title: DynamicValue<String> = DynamicValue()
    private var service: FactsService = FactsService()
    
    init(withDataSource dataSource: GenericDataSource<FactModel>?) {
        self.dataSource = dataSource
        self.title.value = ""
    }

    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        service.fetchFacts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    if let rows = converter.rows,
                       let title = converter.title
                    {
                        let filteredFacts = rows.filter({ $0.title != nil || $0.description != nil || $0.imageHref != nil })
                        self.dataSource?.facts.value = filteredFacts
                        self.title.value = title
                        completion?(Result.success(true))
                    } else {
                        self.error.value = .custom(string: "Error while parsing json data")
                        completion?(Result.failure(.custom(string: "Error while parsing json data")))
                    }

                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    self.error.value = error
                    completion?(Result.failure(error))
                    break
                }
            }
        }
    }
}
