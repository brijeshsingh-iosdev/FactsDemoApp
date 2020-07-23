//
//  MockFeedsService.swift
//  FactsDemoAppTests
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation
@testable import FactsDemoApp

class MockFeedsService: FactsServiceProtocol {
    var feedsData: FactsModel?
    func fetchFacts(_ completion: @escaping ((Result<FactsModel, ErrorResult>) -> Void)) {
        if let data = feedsData {
            completion(Result.success(data))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No converter")))
        }
    }
}
