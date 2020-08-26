//
//  ViewController.swift
//  BowFolios
//
//  Created by Tianhui Zhou on 8/25/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //sign in the user
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                if user != nil {
                   self.performSegue(withIdentifier: "homeSegue", sender: self)
                }
            }
        })
    }
    
}

