//
//  Networking.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/15/22.
//

import Foundation
import Combine

class ProductsService {
    static let shared = ProductsService()
    private var subscribers = Set<AnyCancellable>()

    /// Networking with Combine
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<[T], Error>) -> Void) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [T].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { resultCompletion in
                switch resultCompletion {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            }, receiveValue: { (resultArray) in
                completion(.success(resultArray))
            })
            .store(in: &subscribers)
    }

    /// Networking with URL Session
    func sendRequest(completionHandler: @escaping ([DataModel]) -> Void)  {

           let sessionConfig = URLSessionConfiguration.default
           let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

           guard let URL = URL(string: "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json") else {return}
           var request = URLRequest(url: URL)
           request.httpMethod = "GET"

           let task = session.dataTask(with: request, completionHandler: { data, response, error in
               guard let httpResponse = response as? HTTPURLResponse,
                     (200...299).contains(httpResponse.statusCode) else {
                   return
               }
               guard let data = data, error == nil else { return }
               do {
                   let decodedObject = try JSONDecoder().decode([DataModel].self, from: data)
                   completionHandler(decodedObject)
               }
               catch {
                   debugPrint("Error Decoding Data")
               }

           })
           task.resume()
           session.finishTasksAndInvalidate()
       }

}


enum Endpoint {
    case homeScreenInfoFetch
    var url: String {
        switch self {
        case .homeScreenInfoFetch:
            return "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
        }
    }
}
