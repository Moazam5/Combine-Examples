//
//  ItemCellViewModel.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/25/22.
//

import Foundation
import UIKit

protocol ItemCellViewModel {
    var backgroundImage: String { get }
    var topDescription: String { get }
    var title: String { get }
    var promoMessage: String { get }
    var bottomDescription: String? { get }
    var content: [Content]? { get }

    func loadImage(fromURL: String)

}

//class ItemCellViewModelImpl: ItemCellViewModel {
//    var backgroundImage: String
//
//    var topDescription: String
//
//    var title: String
//
//    var promoMessage: String
//
//    var bottomDescription: String?
//
//    var content: [Content]?
//
//    func loadImage(fromURL: String) {
//
//    }
//
//
//}
