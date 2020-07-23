//
//  FactsCellViewModel.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import UIKit

class FactsCellViewModel: NSObject {
   var fact: DynamicValue<FactModel> = DynamicValue()
    
   init(with fact: FactModel) {
       self.fact.value = fact
   }
}
