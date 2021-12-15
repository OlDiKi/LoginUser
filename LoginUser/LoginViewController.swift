//
//  ViewController.swift
//  LoginUser
//
//  Created by Дмитрий Олейнер on 14.12.2021.
//

import UIKit

let userNameEnter = "Dmitriy"
let passwordEnter = "Oleyner101"

class ViewController: UIViewController {

    @IBOutlet weak var userNameTitle: UITextField!
    @IBOutlet weak var passwordTitle: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTitle.layer.cornerRadius = 10
        passwordTitle.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameTitle.text == userNameEnter && passwordTitle.text == passwordEnter {
            let welcomeVC = segue.destination as! WelcomeViewController
            welcomeVC.welcomeUser = "Welcome, \(userNameEnter)!"
        } else {
            let allertController = UIAlertController(title: "Access Denied", message: "Wrong user name or password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: .cancel)
            allertController.addAction(action)
            self.present(allertController, animated: true, completion: nil)
        }
    }
        
    
    @IBAction func forgotUserNameTap() {
        let allertControllerUserName = UIAlertController(title: "Oops!", message: "Your name is Dmitriy.", preferredStyle: .alert)
        let actionAllertUserName = UIAlertAction(title: "Fine", style: .default)
            allertControllerUserName.addAction(actionAllertUserName)
            self.present(allertControllerUserName, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordTap() {
        let allertControllerPassword = UIAlertController(title: "It so sad!", message: "Your password is Oleyner101.", preferredStyle: .alert)
        let actionAllertPassword = UIAlertAction(title: "Ok", style: .default)
            allertControllerPassword.addAction(actionAllertPassword)
            self.present(allertControllerPassword, animated: true, completion: nil)
    }
}
