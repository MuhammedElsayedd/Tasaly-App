//
//  ViewController.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/16/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 20
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.text = "MuhammedElsayedd"
        passwordTextField.text = "iosdeveloper"
        
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        TMDBClient.getRequestToken(completion: handleRequestTokenResponse(success:error:))
    }
    func handleRequestTokenResponse(success: Bool, error: Error?) {
        if success {
            TMDBClient.login(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "", completion: handleLoginResponse(success:error:))
        } else {
            performSegue(withIdentifier: "unCompleteLogin", sender: nil)
        }
    }
    func handleLoginResponse(success: Bool, error: Error?) {
        if success {
            TMDBClient.createSessionId(completion: handleSessionResponse(success:error:))
        } else {
             performSegue(withIdentifier: "unCompleteLogin", sender: nil)
        }
    }
    func handleSessionResponse(success: Bool, error: Error?) {
       
        if success {
            performSegue(withIdentifier: "completeLogin", sender: nil)
            
            
        } else {
            performSegue(withIdentifier: "unCompleteLogin", sender: nil)
        }
    }
    
    

}

