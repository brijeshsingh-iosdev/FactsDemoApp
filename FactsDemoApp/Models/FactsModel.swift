//
//  FeedsModel.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import Foundation

struct FactsModel: Decodable {
    let title: String?
    let rows: [FactModel]?
}

extension FactsModel: Parceable {
    static func parseObject(data: Data) -> Result<FactsModel, ErrorResult> {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode(FactsModel.self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse FeedsModel results"))
        }
    }
}
