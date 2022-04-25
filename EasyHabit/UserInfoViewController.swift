//
//  UserInfoViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/23/22.
//

import UIKit
import CoreData

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var wakeupTimePicker: UIDatePicker!
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var dobError: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    var name: String!
    var dob: String!
    var wakeUpTime: String!
    var info = [UserInfoFinal]()
    
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 15
        resetForm()

    }
    
    func resetForm()
        {
            continueButton.isEnabled = false
            
            nameError.isHidden = false
            dobError.isHidden = false
            
            
            nameError.text = "Name Required"
            dobError.text = "Date Of Birth Required"
            
            
            nameTF.text = ""
            dobTF.text = ""
            
        }
    
    @IBAction func nameChanged(_ sender: Any)
    {
        if let name = nameTF.text
                {
                    if let errorMessage = invalidName(name)
                    {
                        nameError.text = errorMessage
                        nameError.isHidden = false
                    }
                    else
                    {
                        nameError.isHidden = true
                    }
                }
                
                checkForValidForm()
    }
    
    func invalidName(_ name: String) -> String?
        {
        if name.count > 30
        {
            return "Name must not exceed 30 characters"
        }
        if name.count < 1
        {
            return "Name Required"
        }
        if !isValidName(name)
        {
            return "Name must not contain special characters"
        }
        return nil
        }
    
    func isValidName(_ name: String) -> Bool {
        let regularExpression = #"^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"#
        
        

        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: name)
        
        
    }
    
    @IBAction func dobChanged(_ sender: Any)
    {
        if let dob = dobTF.text
                {
                    if let errorMessage = invalidDob(dob)
                    {
                        dobError.text = errorMessage
                        dobError.isHidden = false
                    }
                    else
                    {
                        dobError.isHidden = true
                    }
                }
                checkForValidForm()
    }
    
    func invalidDob(_ dateOfBirth: String) -> String?
    {
        if dateOfBirth.count < 1
        {
            return "Date Of Birth Required"
        }
        if !isValidDate(dateOfBirth)
        {
            return "Please insert valid date format"
        }
        return nil
    }
    
    func isValidDate(_ dateOfBirth: String) -> Bool
    {
        let regularExpression = #"^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: dateOfBirth)
    }
    
    @IBAction func tapContinue(_ sender: Any)
    {
        save()
        UserDefaults.standard.set(true, forKey: "isIntroFinished")
    }
    
    func checkForValidForm()
        {
            if nameError.isHidden && dobError.isHidden
            {
                continueButton.isEnabled = true
            }
            else
            {
                continueButton.isEnabled = false
            }
        }
}
extension UserInfoViewController {
    func save()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
             
                    let entity = NSEntityDescription.entity(forEntityName: "UserInfoFinal", in: context)
                    let newInfo = UserInfoFinal(entity: entity!, insertInto: context)
                    
                    newInfo.name = nameTF.text
                    newInfo.dob = dobTF.text
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "HH:mm"
                    let strDate = dateFormatter.string(from: wakeupTimePicker.date)
                    newInfo.wakeUpTime = strDate//timeTF.date//String(timeTF)
        
                    do
                    {
                        try context.save()
                        info.append(newInfo)
                        print("succeed")
                        navigationController?.popViewController(animated: true) 
                    }
                    catch
                    {
                        print("context save error")
                    }
                resetForm()
    }
}
