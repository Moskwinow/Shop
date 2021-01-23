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
                    self?.showAlert(title: "Успех", message: message, status: 1)
                }
            case .failure(let error_massage):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Ошибка", message: error_massage, status: 0)
                }
                
            }
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton!) {
        self.navigationController?.pushViewController(viewModel.builder.createModule() as! UIViewController, animated: true)
    }
    
    
    private func showAlert(title: String?, message: String?, status: Int) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var alertAction = UIAlertAction()
        switch status {
        case 1:
            alertAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
                DispatchQueue.main.async {
                    self.viewModel.builder = ProductBuilder()
                    self.present(self.viewModel.builder.createModule() as! UIViewController, animated: true, completion: nil)
                }
            }
        case 0:
            alertAction = UIAlertAction(title: "OK", style: .default) { _ in
                
            }
        default: break
        }
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
