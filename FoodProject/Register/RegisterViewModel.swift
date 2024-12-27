//
//  RegisterViewModel.swift
//  FoodProject
//
//  Created by Gul Kzm on 22.12.24.
//

import Foundation

class RegisterViewModel {
    var users = [User]()
    private let fileManagerAdapter = FileManagerUser()
    
    func getData() {
        fileManagerAdapter.readData { usersData in
            self.users = usersData
        }
    }
    
    func saveUserData(user: User) {
        users.append(user)
        fileManagerAdapter.writeData(user: users)
    }
}
