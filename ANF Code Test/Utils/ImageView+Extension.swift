//
//  ImageView+Extension.swift
//  ANF Code Test
//
//  Created by Moazam Mir on 2/25/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            print("Error loading picture from URL")
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


/*
 func loadImge(withUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }


 DispatchQueue.global().async { [weak self] in
     let session = URLSession(configuration: .default)

     let downloadPicTask = session.dataTask(with: url) { (data, response, error) in

         if let e = error {
             print("Error downloading cat picture: \(e)")
         } else {

             if let res = response as? HTTPURLResponse {
                 print("Downloaded cat picture with response code \(res.statusCode)")
                 if let imageData = data {
                     // Finally convert that Data into an image and do what you wish with it.
                     DispatchQueue.main.async {
                         self?.image = UIImage(data: imageData)
                     }
                     // Do something with your image.
                 } else {
                     print("Couldn't get image: Image is nil")
                 }
             } else {
                 print("Couldn't get response code for some reason")
             }
         }
     }
     downloadPicTask.resume()
 */
