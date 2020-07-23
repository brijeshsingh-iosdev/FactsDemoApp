//
//  FeedsServiceTests.swift
//  FactsDemoAppTests
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import XCTest
@testable import FactsDemoApp

class FeedsServiceTests: XCTestCase {
    func testCancelRequest() {
        let service: FactsService! = FactsService()
        service.fetchFacts { (_) in
        }
        service.cancelFetchFacts()
        XCTAssertNil(service.task, "Expected task nil")
    }
}
