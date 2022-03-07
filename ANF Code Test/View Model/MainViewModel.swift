//
//  ViewModel.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/24/22.
//

import Combine
import UIKit

protocol MainViewModel {
    var productService: ProductsService { get }
    var endpoint: Endpoint { get }
    func fetchData()
}

class MainViewModelImpl: NSObject, MainViewModel {
    var productService: ProductsService
    var endpoint: Endpoint
    var userSubject = PassthroughSubject<[DataModel], Error>()

    init(service: ProductsService, endpoint: Endpoint) {
        self.productService = service
        self.endpoint = endpoint
    }

    func fetchData() {
        guard let url = URL(string: endpoint.url) else {return}

        productService.fetchData(url: url) { [weak self] (result: Result<[DataModel], Error>) in
            switch result {
            case .success(let info):
                self?.userSubject.send(info)
            case .failure(let error):
                self?.userSubject.send(completion: .failure(error))
            }
        }
    }
}

