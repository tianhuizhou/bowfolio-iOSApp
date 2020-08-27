//
//  HomeViewController.swift
//  BowFolios
//
//  Created by Tianhui Zhou on 8/26/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore


class HomeViewController: UIViewController {

    @IBOutlet weak var lableOne: UILabel!
    
    
    @IBOutlet weak var labelTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let db = Firestore.firestore()
        
        db.collection("wine").document("tianhui").getDocument {(document, error) in
            
            if error == nil {
                
                if document != nil && document!.exists {
                    
                    let documentData = document!.data()
                    print("You got it!")
                    self.lableOne.text = documentData?["day"] as? String
                    self.labelTwo.text = documentData?["month"] as? String
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
