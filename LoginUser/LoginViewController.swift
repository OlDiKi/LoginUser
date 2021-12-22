//
//  ViewController.swift
//  LoginUser
//
//  Created by Дмитрий Олейнер on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

//MARK: - IB Outlets
    @IBOutlet var userNameTitle: UITextField!
    @IBOutlet var passwordTitle: UITextField!
    
//MARK: - Private properties
    private let user = "Dmitriy"
    private let password = "Oleyner101"
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeUser = user
    }
    
//MARK: - Display
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTitle.layer.cornerRadius = 10
        passwordTitle.layer.cornerRadius = 10
        gradientBackground()
    }
    
 //MARK: - IBActions
    @IBAction func logInTap() {
        if userNameTitle.text != user || passwordTitle.text != password {
            showAlert(title: "Invalid login or pasword", message: "Please, enter correct login and password", textField: passwordTitle)
        }
    }

    
    @IBAction func forgotUserNameTap(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "You name is \(user)")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(title: "It's so sad!", message: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTitle.text = ""
        passwordTitle.text = ""
    }
}
    
// MARK: - Private Methods
        
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        }
    
    private func gradientBackground () {
        let color1 = UIColor(red: 0 / 255, green: 183 / 255, blue: 142 / 255, alpha: 1).cgColor
        let color2 = UIColor(red: 0 / 255, green: 153 / 255, blue: 121 / 255, alpha: 1).cgColor
        let color3 = UIColor(red: 0 / 255, green: 90 / 255, blue: 121 / 255, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTitle {
            passwordTitle.becomeFirstResponder()
        } else {
            logInTap()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}




