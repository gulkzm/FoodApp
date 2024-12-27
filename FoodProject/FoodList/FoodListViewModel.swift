//
//  FoodListViewModel.swift
//  FoodProject
//
//  Created by Gul Kzm on 21.12.24.
//

import Foundation

class FoodListViewModel {
    var items = [FoodModel]()
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getFoodData() {
        if let url = Bundle.main.url(forResource: "Food", withExtension: "json"),
            let data = try? Data(contentsOf: url) {
            do {
                items = try JSONDecoder().decode([FoodModel].self, from: data)
                success?()
            } catch {
                errorHandler?(error.localizedDescription)
            }
        }
    }
}
