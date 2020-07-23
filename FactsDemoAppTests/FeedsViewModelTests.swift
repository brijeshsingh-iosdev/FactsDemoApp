//
//  FeedsViewModelTests.swift
//  FactsDemoAppTests
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import XCTest
@testable import FactsDemoApp

class FeedsViewModelTests: XCTestCase {

    var viewModel: FactsViewModel!
    private var mockDataSource: GenericDataSource<FactModel>!
    private var mockService: MockFeedsService!

    override func setUp() {
        super.setUp()
        self.mockService = MockFeedsService()
        self.mockDataSource = GenericDataSource<FactModel>()
        self.viewModel = FactsViewModel(withDataSource: mockDataSource)
    }

    override func tearDown() {
        self.viewModel = nil
        self.mockDataSource = nil
        self.mockService = nil
        super.tearDown()
    }

    func testFetchFeeds() {
        mockService.feedsData = FactsModel(title: "Canada", rows: [])
        viewModel.fetchServiceCall { result in
            switch result {
            case .failure :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default: break
            }
        }
    }

    func testFetchNoFeeds() {
        mockService.feedsData = nil
        viewModel.fetchServiceCall { result in
            switch result {
            case .success :
                XCTAssert(false, "ViewModel should not be able to fetch ")
            default: break
            }
        }
    }

}
