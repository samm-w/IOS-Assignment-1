//
//  DatabaseTableViewController.swift
//  SamWhelanAssignment1
//
//  Created by  on 3/23/21.
//

import UIKit

class DatabaseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblView: UITableView!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.people.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func selectAvatar(value: Int) -> UIImage{
        if value == 0{
            return UIImage(named: "pinkguy.jpg")!
        }else if value == 1 {
            return UIImage(named: "redguy.png")!
        }else{
            return UIImage(named: "whiteguy.png")!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = mainDelegate.people[rowNum].name
        tableCell.secondaryLabel.text = mainDelegate.people[rowNum].email
        tableCell.myImageView.image = selectAvatar(value: mainDelegate.people[rowNum].avatar!)
        
        
        tableCell.accessoryType = .disclosureIndicator
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowNum = indexPath.row
        //let gender = selectGender(value: mainDelegate.people[rowNum].gender)
        
        let alertController = UIAlertController(title: mainDelegate.people[rowNum].name, message: "Address: \(mainDelegate.people[rowNum].address ?? "default")\n Phone Number \(mainDelegate.people[rowNum].phoneNumber ?? "123-456-7890")\n Age: \(mainDelegate.people[rowNum].age ?? 0)\n Gender: \(mainDelegate.people[rowNum].gender ?? "NA")\n Date: \(mainDelegate.people[rowNum].date ?? "NA")", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.backgroundView = UIImageView(image: UIImage(named: "background.jpg"))

        mainDelegate.readDataFromDatabase()
        
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
