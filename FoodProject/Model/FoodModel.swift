//
//  FoodModel.swift
//  FoodProject
//
//  Created by Gul Kzm on 25.12.24.
//

import Foundation

struct FoodModel: Codable {
    let foodName: String?
    let foodImage: String?
    let item: [FoodItem]?
}
struct FoodItem: Codable {
    let itemName: String?
    let itemImage: String?
    let price: Double?
    let currency: String?
}
