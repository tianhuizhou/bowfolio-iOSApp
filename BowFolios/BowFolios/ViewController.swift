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


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let db = Firestore.firestore()
        
        //adding data to cloud database
        //adding these data to the collection with randomly generated DocumentID
        //db.collection("profile").addDocument(data: ["name": "Bobby Zhou", "description":"I am the best Yasso in the world! Face the wind!"])
        
        //adding a document with a specific DocumentID or replace it
        //db.collection("wine").document("tianhui").setData(["year": 1996, "month": 7, "day":14])
        
        self.emailField.delegate = self
        self.passwordField.delegate = self
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //sign in the user
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                if user != nil {
                    print("successfully log in with firebase")
                   self.performSegue(withIdentifier: "gohomeSegue", sender: self)
                }
            } else {
                print("Error, no such an account!")
            }
        })
    }
    
}

