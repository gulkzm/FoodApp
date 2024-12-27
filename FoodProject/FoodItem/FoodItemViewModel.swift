//
//  FoodItemViewModel.swift
//  FoodProject
//
//  Created by Gul Kzm on 25.12.24.
//

import Foundation

class FoodItemViewModel {
    var category: FoodModel?
    var items = [FoodItem]()
    var basketItems = [FoodItem]()
    
    let manager = FileManagerHelper()
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func configureItemsData() {
        items = category?.item ?? []
    }
    
    func addItemToBasket(index: Int) {
        let selectedItem = items[index]
        
        manager.readData { basketItems in
            self.basketItems = basketItems ?? []
            
            self.basketItems.append(selectedItem)
            self.manager.writeData(item: self.basketItems)
        }
    }
}
