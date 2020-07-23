//
//  FactsDataSource.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import UIKit

class GenericDataSource<T>: NSObject {

    var facts: DynamicValue<[T]> = DynamicValue([])
}

class FactsDataSource: GenericDataSource<FactModel>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.value?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FactsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let fact = self.facts.value?[indexPath.row] {
            let cellViewModel = FactsCellViewModel(with: fact)
            cell.bind(to: cellViewModel)
            guard let imageUrl = fact.imageHref else {
                return cell
            }
            ImageHelper().updateImageForTableViewCell(cell, inTableView: tableView, imageURL: imageUrl, atIndexPath: indexPath)
        }
        return cell
    }
}
