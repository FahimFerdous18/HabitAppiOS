//
//  ChooseHabitViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/28/22.
//

import UIKit
import CoreData
var HabitList=[Habit]()

class ChooseHabitViewController: UIViewController {
    var infosave: [NSManagedObject] = []
    
    var context:NSManagedObjectContext!

    @IBOutlet weak var warningBtn: UILabel!
    @IBOutlet weak var habitCol: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.habitCol.delegate = self
        self.habitCol.dataSource = self
        self.habitCol.register(UINib(nibName: "ChooseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "habitChoose")
        
        self.context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        
        let inforeq:NSFetchRequest<Habit>=Habit.fetchRequest()
                let nameSort = NSSortDescriptor(key:"habitname", ascending:true)
                inforeq.sortDescriptors = [nameSort]
                var request = NSFetchRequest<NSFetchRequestResult>()
                request = Habit.fetchRequest()
                request.returnsObjectsAsFaults = false
                do {
                HabitList = try
                    self.context.fetch(inforeq)
                    DispatchQueue.main.async {
                            self.habitCol.reloadData()
                    }
                    print("Fetched")

                }
                catch
                {
                print("Fetch Failed")
                }
        
        
        
        
//        let names=["Add Custom","Reading Book","Walking","Drinking","Running","Exercise","Call to family","Watch TV","Taking food"]
//                let logos=["Group-2.png","reading.png","walk.png","drinking.png","running.png","exercise.png","callfamily.png","tv.png","food.png"]
//                for (a, b) in zip(names, logos){
//                    let defaultHabits = NSEntityDescription.insertNewObject(forEntityName: "Habit", into: self.context)
//                    defaultHabits.setValue(a, forKey: "habitname")
//                    defaultHabits.setValue(b, forKey: "habitimage")
//                    print(b)
//                      do {
//                          try self.context.save()
//                         print("SAVED")
//                    }
//                    catch {
//
//                         NSLog("ERROR: Could not save computer. Error: '\(error)'")
//                         return
//                    }
//                }



        // Do any additional setup after loading the view.
    }
    
   

    func presentTextField(){
                    let alertController = UIAlertController(title: "Add custom habit name", message: "", preferredStyle: UIAlertController.Style.alert)
                    alertController.addTextField { (textField : UITextField!) -> Void in
                            textField.placeholder = ""
                        }
               
                let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { [self] alert -> Void in
                            let name = alertController.textFields![0] as UITextField
                    let message = "exercise.png"//alertController.textFields![1] as UITextField
                    
                    save(name: name.text!, message: message)
                        })
                    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                            (action : UIAlertAction!) -> Void in })


                        alertController.addAction(saveAction)
                        alertController.addAction(cancelAction)

                    self.present(alertController, animated: true, completion: nil)
                }
    
        func save(name: String, message: String)
        {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Habit", in: managedContext)!
            let add = NSManagedObject(entity: entity, insertInto: managedContext)
            add.setValue(name, forKey: "habitname")
            add.setValue(message, forKey: "habitimage")
            
            do {
                try managedContext.save()
                infosave.append(add)
                DispatchQueue.main.async {
                    self.habitCol.reloadData()
                }
                
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }




extension ChooseHabitViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HabitList.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row != 0 && count<=5  {
                    self.performSegue(withIdentifier: "habitShow", sender: indexPath)
                    
                }
                else{
                    presentTextField()
                    
                }

        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "habitShow" {
                    if let indexPaths = habitCol.indexPathsForSelectedItems{
                        let destinationController = segue.destination as! SetHabitViewController
                        destinationController.selectedNoted = HabitList[indexPaths[0].row]
                        habitCol.deselectItem(at: indexPaths[0], animated: false)
                    }
                }
            }
    
   
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitChoose", for: indexPath) as! ChooseCollectionViewCell
            cell.layer.cornerRadius = 10
            
                 
            let info = HabitList[indexPath.row]
                    cell.hname?.text = info.habitname
                    cell.icon.image = UIImage(named: info.habitimage!)
                    
            if info.habitdateData != nil {
                    cell.selectLabel.text = info.habitdateData
                    }
            else {
                cell.selectLabel.isHidden = true
            }

            return cell
    }
    
}

