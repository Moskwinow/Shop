//
//  LoginViewController.swift
//  Shop
//
//  Created by Максим Вечирко on 22.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: UIButton!) {
        guard let email = emailField.text,
              email != "",
              let password = passwordField.text,
              password != "" else {return}
        
        viewModel.login(email: email, password: password) { [weak self] (result) in
            switch result {
            case .success(let message):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Успех", message: message)
                }
            case .failure(let error_massage):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Ошибка", message: error_massage)
                }
                
            }
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton!) {
        self.navigationController?.pushViewController(viewModel.builder.createModule() as! UIViewController, animated: true)
    }
    
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            
        }
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
