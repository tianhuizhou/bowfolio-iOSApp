//
//  ProfileTableViewController.swift
//  BowFolios
//
//  Created by Tianhui Zhou on 8/26/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class ProfileTableViewController: UITableViewController {
    
    var name = ""
    var discription = ""
    
    
    
    
    let db = Firestore.firestore()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        print("inside the viewdidload: \(self.name)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        let db = Firestore.firestore()
//
//        db.collection("wine").document("tianhui").getDocument {(document, error) in
//
//            if error == nil {
//
//                if document != nil && document!.exists {
//
//                    let documentData = document!.data()
//                    print("You got it!")
//                    self.name = documentData?["day"] as! String
//                    self.discription = documentData?["month"] as! String
//                }
//            }
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProfileTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProfileTableViewCell else {
            fatalError("The dequeue cell is not an instance of ProfileTableViewCell")
        }


        // Configure the cell...
        self.db.collection("wine").document("tianhui").getDocument {(document, error) in
            
            if error == nil {
                
                if document != nil && document!.exists {
                    
                    let documentData = document!.data()
                    print("You got it!")
                    cell.nameLabel.text = documentData?["day"] as? String
                    cell.discriptionLabel.text = documentData?["month"] as? String
                    
                    
                }
            }
        }
        //cell.nameLabel.text = accessData()
        //cell.discriptionLabel.text = accessData()


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - helper
    func accessData() -> String {
        
        var name1 = ""
        var discription1 = ""
        self.db.collection("wine").document("tianhui").getDocument {(document, error) in
            
            if error == nil {
                
                if document != nil && document!.exists {
                    
                    let documentData = document!.data()
                    print("You got it!")
                    name1 = documentData?["day"] as! String
                    discription1 = documentData?["month"] as! String
                    print(name1)
                    
                }
            }
        }
        print(name1)
        return name1
    }
}
