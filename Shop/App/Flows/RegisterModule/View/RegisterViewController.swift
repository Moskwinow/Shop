//
//  RegisterViewController.swift
//  Shop
//
//  Created by Максим Вечирко on 22.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var creditCardField: UITextField!
    @IBOutlet weak var usernamaeField: UITextField!
    
    
    var viewModel: RegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerAction(_ sender: UIButton!) {
        
        guard let username = usernamaeField.text, username != "", let email = emailField.text, email != "", let password = passwordField.text, password != "", let bio = bioField.text, bio != "", let gender = genderField.text, gender != "", let card = creditCardField.text, card != ""  else {
            return
        }
        
        let user = User(id: 1, username: username, email: email, password: password, bio: bio, gender: gender, credit_card: card)
        viewModel.register(user: user) { (result) in
            
            switch result {
            case true:
                DispatchQueue.main.async {
                    self.showAlert(title: "Успех", message: "Пользователь с ником \(user.username) успешно зарегистрирован")
                }
            case false:
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка", message: "Что то пошло не так")
                }
            }
        }
    }
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            
        }
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
