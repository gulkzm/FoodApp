//
//  LoginController.swift
//  FoodProject
//
//  Created by Gul Kzm on 22.12.24.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let viewModel = LoginViewModel()
    let fileManagerAdapter = FileManagerUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
    }
    
    func readData() {
        fileManagerAdapter.readData { usersData in
            self.viewModel.users = usersData
        }
    }
    
    @IBAction func loginbuttoonTapped(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            if viewModel.users.contains(where: { $0.email == email && $0.password == password}) {
//                UserDefaults.standard.set(true, forKey: "loggedIn")
                let controller = storyboard?.instantiateViewController(withIdentifier: "\(FoodListController.self)") as! FoodListController
                navigationController?.show(controller, sender: nil)
            } else{
                let alertController = UIAlertController(title: "Error", message: "Sehv melumat daxil etdiniz", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(action)
                present(alertController, animated: true)
            }
           
        }
    }
    
    @IBAction func registerbuttonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        controller.registerCallback = {user in
            self.emailTextField.text = user.email
            self.readData()
        }
        navigationController?.show(controller, sender: nil)
    }
        
}
