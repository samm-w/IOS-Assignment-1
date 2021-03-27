//
//  FormViewController.swift
//  SamWhelanAssignment1
//
//  Created by  on 2/11/21.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfAddress: UITextField!
    @IBOutlet var tfPhoneNumber: UITextField!
    
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbEmail: UILabel!
    @IBOutlet var lbAddress: UILabel!
    @IBOutlet var lbPhoneNumber: UILabel!
    
    @IBOutlet var slAge: UISlider!
    @IBOutlet var lbAge: UILabel!
    
    @IBOutlet var sgGender: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    
    var avatarID: Int = 1
    var person: Data = Data.init()
    
    @IBAction func addPerson(sender: Any){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateText = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        self.person.initWithData(theRow: 0, theName: tfName.text!, theEmail: tfEmail.text!, theAddress: tfAddress.text!, thePhoneNumber: tfPhoneNumber.text!, theAge: Int(slAge.value), theGender: selectGender(value: sgGender.selectedSegmentIndex), theDate: dateText, theAvatar: avatarID)
        rememberEnteredData()
        
        performSegue(withIdentifier: "PeopleTransfer", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! AvatarViewController
        vc.person = self.person
    }
    
    func selectGender(value: Int)-> String{
        if value == 0 {
            return "Male"
        }else{
            return "Female"
        }
    }
    
    func rememberEnteredData(){
        let defaults = UserDefaults.standard
        defaults.set(tfName.text, forKey: "lastName")
        defaults.set(tfEmail.text, forKey: "lastEmail")
        defaults.set(tfAddress.text, forKey: "lastAddress")
        defaults.set(tfPhoneNumber.text, forKey: "lastPhoneNumber")
        defaults.synchronize()
    }
    
    func updateLabel(){
        let age = slAge.value
        let strAge = String(format: "%.0f", age)
        lbAge.text = strAge
    }
    
    @IBAction func sliderValueChange(sender: UISlider){
        updateLabel()
    }
    
    @IBAction func submitInfo(sender: Any){
        
        let name = tfName.text
        let email = tfEmail.text
        
        let alert = UIAlertController(title: "Thank You", message: "Thank you \(name ?? "Jim Kirk") of \(email ?? "jim@kirk.com") for your time", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        
        if let name = defaults.object(forKey: "lastName") as? String {
            tfName.text = name
        }
        
        if let email = defaults.object(forKey: "lastEmail") as? String {
            tfEmail.text = email
        }
        
        if let address = defaults.object(forKey: "lastAddress") as? String {
            tfAddress.text = address
        }
        
        if let phoneNumber = defaults.object(forKey: "lastPhoneNumber") as? String {
            tfPhoneNumber.text = phoneNumber
        }
        
        // Do any additional setup after loading the view.
        updateLabel()
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
