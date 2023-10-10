//
//  LoginViewController.swift
//  DragonBall
//
//  Created by Daniel Cazorro Frías on 10/10/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    func onLoginPressed(email: String?, password: String?)
}

class LoginViewController: UIViewController {

    // MARK: - IBOutlet -
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailFieldError: UILabel!
    @IBOutlet weak var passwordFieldError: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    // MARK: - IBAction -
    @IBAction func onLoginPressed() {
        // TODO: Obtener el email y password introducidos por el usuario y enviarlos al servicio del API de Login (VIEWMODEL)
        
        viewModel?.onLoginPressed(email: emailField.text, password: passwordField.text)
        
    }
    
    // MARK: - Public Properties -
    var viewModel: LoginViewControllerDelegate?
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func initViews() {
        emailField.delegate = self
        emailField.tag = 0
        passwordField.delegate = self
        passwordField.tag = 1
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            emailFieldError.isHidden = true
            
        case 1:
            passwordFieldError.isHidden = true
        default: break
            
        }
        /*
        if emailField == textField {
            emailFieldError.isHidden = true
        } else if passwordField == textField {
            passwordFieldError.isHidden = true
        }
         */
    }
}
