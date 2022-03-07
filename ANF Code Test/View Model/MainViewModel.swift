//
//  ViewModel.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/24/22.
//

import Foundation
import Combine

protocol MainViewModel {
    var productService: ProductsService { get }
    var productData: [DataModel] { get }
    func onLoad()
    func fetchData()
}

class MainViewModelImpl: NSObject, MainViewModel {
    var productService: ProductsService
    var productData: [DataModel]

    var data = CurrentValueSubject<[DataModel], Never>([DataModel]())
    
    init(service: ProductsService, productData: [DataModel] = []) {
        self.productService = service
        self.productData = productData
    }
    func onLoad() {
      //  productService.sendRequest()
    }

    func fetchData() {

    }
}


