//
//  RegisterController.swift
//  FoodProject
//
//  Created by Gul Kzm on 22.12.24.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    
    let viewModel = RegisterViewModel()
    var registerCallback: ((User) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData()
       
    }
    
    @IBAction func registerbuttonTapped(_ sender: Any) {
        if let fullname = fullnameTextField.text,
           let email = emailTextField.text,
           let phonenumber = phonenumberTextField.text,
           let password = passwordTextField.text {
            let user: User = .init(email: email, password: password, fullname: fullname, phonenumber: phonenumber)
            
            viewModel.saveUserData(user: user)
            
            registerCallback?(user)
            
            navigationController?.popViewController(animated: true)
        }
    }
}
