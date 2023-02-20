//
//  DataBase.swift
//  shoppingAPP2
//
//  Created by Meirkhan Nishonov on 17.02.2023.
//

import Foundation

struct DataBase {
    static let productList: [Product] = [
        Product (name: "Apple", tourPrice: 1260.49, imageName: "apple"),
        Product (name: "Mango", tourPrice: 990.99, imageName: "mango"),
        Product (name: "Avocado", tourPrice: 540, imageName: "avocado"),
        Product (name: "Strawberry", tourPrice: 770.09, imageName: "strawberry"),
        Product (name: "Watermelon", tourPrice: 1399.90, imageName: "watermelon"),
        Product (name: "Banana", tourPrice: 1050.49, imageName: "banana"),
        Product (name: "Lime", tourPrice: 660.90, imageName: "limes")
    ]
}
struct Product {
    let name: String
    let tourPrice: Float
    let imageName: String
}
