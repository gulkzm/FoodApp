//
//  FileManagerUser.swift
//  FoodProject
//
//  Created by Gul Kzm on 27.12.24.
//

import Foundation
//
//  FileManagerHelper.swift
//  FoodProject
//
//  Created by Gul Kzm on 22.12.24.
//

import Foundation


enum FileNameUser: String {
    case users = "Users.json"
}

class FileManagerUser {
    func getFilePath(fileName: FileNameUser = .users) -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent(fileName.rawValue)
        print(path)
        return path
    }
  
    func readData(completion: (([User]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(users)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(user:[User]) {
        do {
            let data = try JSONEncoder().encode(user)
            let path = getFilePath()
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
