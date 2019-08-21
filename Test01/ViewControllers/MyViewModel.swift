//
//  MyViewModel.swift
//  Test01
//
//  Created by Abraham Escamilla Pinelo on 8/20/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

class MyViewModel {
    var isLoading: Bool
    var labelText: String?
    
    init() {
        isLoading = false
    }
    
    init(isLoading: Bool, labelText: String?) {
        self.isLoading = isLoading
        self.labelText = labelText
    }
}
