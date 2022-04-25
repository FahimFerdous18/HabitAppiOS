//
//  SetHabitViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/29/22.
//

import UIKit
import CoreData
public var count = 0

class SetHabitViewController: UIViewController {
    var name: String!
    var temp: String = ""

     var sun = "0"
        var mon = "0"
        var tue = "0"
        var wed = "0"
        var thu = "0"
        var fri = "0"
        var sat = "0"
        var swi = "1"
    var selectedNoted: Habit? = nil

    @IBOutlet weak var swiBtn: UISwitch!
    @IBOutlet weak var saturday: UIButton!
    @IBOutlet weak var friday: UIButton!
    @IBOutlet weak var thursday: UIButton!
    @IBOutlet weak var wednesday: UIButton!
    @IBOutlet weak var tuesday: UIButton!
    @IBOutlet weak var monday: UIButton!
    @IBOutlet weak var sunday: UIButton!
    @IBOutlet weak var setTime: UIDatePicker!
    @IBOutlet weak var habitTime: UITextField!
    @IBOutlet weak var addHabitBtn: UIButton!
    @IBOutlet weak var req3: UILabel!
    @IBOutlet weak var req2: UILabel!
    @IBOutlet weak var req1: UILabel!
    @IBOutlet weak var habitname: UILabel!
    @IBOutlet weak var bname5: UILabel!
    @IBOutlet weak var bname4: UILabel!
    @IBOutlet weak var bname3: UILabel!
    @IBOutlet weak var bname2: UILabel!
    @IBOutlet weak var bname1: UILabel!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        habitname.text = selectedNoted?.habitname
        addHabitBtn.layer.cornerRadius = 10
        resetedForm()
        
        
        if(selectedNoted != nil){
                    bname1.text=selectedNoted?.habitname
            button1.setImage(UIImage(named: (selectedNoted?.habitimage)!), for: .normal)
            button1.setTitle(selectedNoted?.habitname, for: .normal)
            habitname.text = (selectedNoted?.habitname)! + " (everyday)"
                habitTime.text = selectedNoted?.timeDuration
                sun = selectedNoted?.sun ?? ""
                mon = selectedNoted?.mon ?? ""
                tue = selectedNoted?.tue ?? ""
                wed = selectedNoted?.wed ?? ""
                thu = selectedNoted?.thu ?? ""
                fri = selectedNoted?.fri ?? ""
                sat = selectedNoted?.sat ?? ""
                swi = selectedNoted?.reminder ?? ""
                }

                if sun == "1"{
                    sunday.layer.backgroundColor = UIColor.blue.cgColor
                    sunday.setTitleColor(.white, for: .normal)
                    sunday.isEnabled = false
                    
                }
                if mon == "1"{
                    monday.layer.backgroundColor = UIColor.blue.cgColor
                    monday.setTitleColor(.white, for: .normal)
                    monday.isEnabled = false
                    
                }
                if tue == "1"{
                    tuesday.layer.backgroundColor = UIColor.blue.cgColor
                    tuesday.setTitleColor(.white, for: .normal)
                    tuesday.isEnabled = false
                    
                }
                if wed == "1"{
                    wednesday.layer.backgroundColor = UIColor.blue.cgColor
                    wednesday.setTitleColor(.white, for: .normal)
                    wednesday.isEnabled = false
                    
                }
                if thu == "1"{
                    thursday.layer.backgroundColor = UIColor.blue.cgColor
                    thursday.setTitleColor(.white, for: .normal)
                    thursday.isEnabled = false
                    
                }
                if fri == "1"{
                    friday.layer.backgroundColor = UIColor.blue.cgColor
                    friday.setTitleColor(.white, for: .normal)
                    friday.isEnabled = false
                    
                }
                if sat == "1"{
                    saturday.layer.backgroundColor = UIColor.blue.cgColor
                    saturday.setTitleColor(.white, for: .normal)
                    saturday.isEnabled = false
                    
                }
                
                if swi == "1"{
                swiBtn.isOn=true
                }
                if swi == "0"{
                swiBtn.isOn=false
                }
                
        
        

        // Do any additional setup after loading the view.
    }
    func resetedForm()
        {
            addHabitBtn.isEnabled = false
            
            req1.isHidden = false
            
            
            
            req1.text = "*Require field"
           
            
            
            habitTime.text = ""
            
            
        }
    
    @IBAction func buttonac1(_ sender: Any)
    {
    }
    @IBAction func buttonac2(_ sender: Any)
    {
    }
    @IBAction func buttonac3(_ sender: Any)
    {
    }
    
    @IBAction func buttonac4(_ sender: Any)
    {
    }
    @IBAction func buttonac5(_ sender: Any)
    {
    }
    @IBAction func sun(_ sender: Any)
    {
        sunday.layer.backgroundColor = UIColor.blue.cgColor
                sunday.setTitleColor(.white, for: .normal)
                sun = "1"
    }
    
    @IBAction func mon(_ sender: Any)
    {
        monday.layer.backgroundColor = UIColor.blue.cgColor
        monday.setTitleColor(.white, for: .normal)
                mon = "1"
    }
    @IBAction func tue(_ sender: Any)
    {
        tuesday.layer.backgroundColor = UIColor.blue.cgColor
        tuesday.setTitleColor(.white, for: .normal)
                tue = "1"
    }
    @IBAction func wed(_ sender: Any)
    {
        wednesday.layer.backgroundColor = UIColor.blue.cgColor
        wednesday.setTitleColor(.white, for: .normal)
                wed = "1"
    }
    @IBAction func thu(_ sender: Any)
    {
        thursday.layer.backgroundColor = UIColor.blue.cgColor
        thursday.setTitleColor(.white, for: .normal)
                thu = "1"
    }
    
    @IBAction func fri(_ sender: Any)
    {
        friday.layer.backgroundColor = UIColor.blue.cgColor
        friday.setTitleColor(.white, for: .normal)
                fri = "1"
    }
    @IBAction func sat(_ sender: Any)
    {
        saturday.layer.backgroundColor = UIColor.blue.cgColor
        saturday.setTitleColor(.white, for: .normal)
                sat = "1"
    }
    
    @IBAction func addBtnac(_ sender: Any)
    {
        count = count + 1
            var  context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Habit")
                do {
                    let results:NSArray = try context.fetch(request) as NSArray
                    for result in results
                    {
                        let habit = result as! Habit
                        if(habit == selectedNoted)
                        {
                            habit.timeDuration = habitTime.text
                            habit.sun = sun
                            habit.mon = mon
                            habit.tue = tue
                            habit.wed = wed
                            habit.thu = thu
                            habit.fri = fri
                            habit.sat = sat
                            habit.habitdateData = String(count)
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "HH:mm"
                            let strDate = dateFormatter.string(from: setTime.date)
                            temp = strDate
                            habit.habitTime = temp
                            habit.reminder = swi
                            
                            try context.save()
                            navigationController?.popViewController(animated: true)
                        }
                    }
                }
                catch
                {
                    print("Fetch Failed")
                }
        
    }
    
    @IBAction func `switch`(_ sender: Any) {
        
    }
    @IBAction func habitChange(_ sender: Any)
    {
        if let name = habitTime.text
                {
                    if let errorMessage = invalidName(name)
                    {
                        req1.text = errorMessage
                        req1.isHidden = false
                    }
                    else
                    {
                        req1.isHidden = true
                    }
                }
                
                checkForValidForm()
    }
    

    func invalidName(_ name: String) -> String?
        {
        if name.count < 1
        {
            return "*Require field"
        }
       
        return nil
        }
    func checkForValidForm()
        {
            if req1.isHidden
            {
                addHabitBtn.isEnabled = true
            }
            else
            {
                addHabitBtn.isEnabled = false
            }
        }
    
    
}
