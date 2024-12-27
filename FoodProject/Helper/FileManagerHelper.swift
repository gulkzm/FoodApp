//
//  FileManagerHelper.swift
//  FoodProject
//
//  Created by Gul Kzm on 22.12.24.
//

import Foundation


enum FileName: String {
    case basket = "Basket.json"
}

class FileManagerHelper {
    func getFilePath(fileName: FileName = .basket) -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent(fileName.rawValue)
        print(path)
        return path
    }
  
    func readData(completion: (([FoodItem]?) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let users = try JSONDecoder().decode([FoodItem].self, from: data)
                completion(users)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            completion(nil)
        }
    }
    
    func writeData(item:[FoodItem]) {
        do {
            let data = try JSONEncoder().encode(item)
            let path = getFilePath()
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
