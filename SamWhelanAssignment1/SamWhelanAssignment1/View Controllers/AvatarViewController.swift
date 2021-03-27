//
//  AvatarViewController.swift
//  SamWhelanAssignment1
//
//  Created by  on 3/23/21.
//

import UIKit

class AvatarViewController: UIViewController {
    
    var person: Data = Data.init()
    @IBOutlet var testLbl: UILabel!
    @IBOutlet var sgAvatar: UISegmentedControl!
    
    @IBAction func addPerson(sender: Any!){
        let avatarID = sgAvatar.selectedSegmentIndex
        
        print("avatar id is \(avatarID)")
        
        person.avatar = avatarID
        
        print("person.avatar is \(person.avatar)")
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode =  mainDelegate.insertIntoDatabase(person: person)
        
        var returnMsg: String = "Person added!"
        
        if returnCode == false{
            returnMsg = "person add failed"
        }
        
        let alertController = UIAlertController(title: "SQLite Add", message: returnMsg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
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
