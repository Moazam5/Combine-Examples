//
//  ViewModel.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/24/22.
//

import Foundation

protocol MainViewModel {
    var productService: ProductsService { get }
    var productData: [DataModel] { get }
    func onLoad()
    func fetchData()
}

class ViewModelImpl: MainViewModel {
    var productService: ProductsService = ProductsService.shared
    var productData: [DataModel] = []

    func onLoad() {

    }

    func fetchData() {

    }
}
