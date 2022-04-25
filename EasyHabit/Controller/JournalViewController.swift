//
//  JournalViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/27/22.
//

import UIKit
import CoreData
var ListItem = [Journal]()

class JournalViewController: UIViewController {
    var context: NSManagedObjectContext!
    
    let celliD = "JournalCollection"

    @IBOutlet weak var emojiFilter: UIButton!
    
    @IBOutlet weak var filtBtn: UIButton!
    @IBOutlet weak var journalCol: UICollectionView!
    @IBOutlet weak var addBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cn = JournalFilter.sharevar.emoji ?? ""
        
        self.journalCol.delegate = self
        self.journalCol.dataSource = self
        self.journalCol.register(UINib(nibName: "JournalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: celliD)
        
        context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext

        if cn == ""{
            let inforeq:NSFetchRequest<Journal>=Journal.fetchRequest()
            var request = NSFetchRequest<NSFetchRequestResult>()
            request = Journal.fetchRequest()
            request.returnsObjectsAsFaults = false
            do {
                ListItem = try
                    context.fetch(inforeq)
                self.journalCol.reloadData()
                print("Fetched")

            }
            catch
            {
                print("Fetch Failed")
            }
            self.journalCol.reloadData()
        }
        
        if cn == "sad" {
            ListItem=[]
                        let query:NSFetchRequest<Journal> = Journal.fetchRequest()
                                //let key = "alex"

                                let predicate = NSPredicate(format: "emoji contains[c] %@", cn)
                                query.predicate = predicate

                                do{
                                    ListItem = try context.fetch(query)
                                    print(ListItem.count)

                                }catch{
                                    print("error")
                                }
                        //ListJournal=[]
                        DispatchQueue.main.async {
                            self.journalCol.reloadData()
        }
            emojiFilter.setImage(UIImage(named: "emoji1.png")?.withRenderingMode(.alwaysOriginal), for: .normal)

        }
        
        if cn == "angry" {
            ListItem=[]
                        let query:NSFetchRequest<Journal> = Journal.fetchRequest()
                                //let key = "alex"

                                let predicate = NSPredicate(format: "emoji contains[c] %@", cn)
                                query.predicate = predicate

                                do{
                                    ListItem = try context.fetch(query)
                                    print(ListItem.count)

                                }catch{
                                    print("error")
                                }
                        //ListJournal=[]
                        DispatchQueue.main.async {
                            self.journalCol.reloadData()
        }
            emojiFilter.setImage(UIImage(named: "emoji2.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        if cn == "fear" {
            ListItem=[]
                        let query:NSFetchRequest<Journal> = Journal.fetchRequest()
                                //let key = "alex"

                                let predicate = NSPredicate(format: "emoji contains[c] %@", cn)
                                query.predicate = predicate

                                do{
                                    ListItem = try context.fetch(query)
                                    print(ListItem.count)

                                }catch{
                                    print("error")
                                }
                        //ListJournal=[]
                        DispatchQueue.main.async {
                            self.journalCol.reloadData()
        }
            emojiFilter.setImage(UIImage(named: "emoji3.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        if cn == "fun" {
            ListItem=[]
                        let query:NSFetchRequest<Journal> = Journal.fetchRequest()
                                //let key = "alex"

                                let predicate = NSPredicate(format: "emoji contains[c] %@", cn)
                                query.predicate = predicate

                                do{
                                    ListItem = try context.fetch(query)
                                    print(ListItem.count)

                                }catch{
                                    print("error")
                                }
                        //ListJournal=[]
                        DispatchQueue.main.async {
                            self.journalCol.reloadData()
        }
            emojiFilter.setImage(UIImage(named: "emoji5.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        if cn == "happy" {
            ListItem=[]
                        let query:NSFetchRequest<Journal> = Journal.fetchRequest()
                                //let key = "alex"

                                let predicate = NSPredicate(format: "emoji contains[c] %@", cn)
                                query.predicate = predicate

                                do{
                                    ListItem = try context.fetch(query)
                                    print(ListItem.count)

                                }catch{
                                    print("error")
                                }
                        //ListJournal=[]
                        DispatchQueue.main.async {
                            self.journalCol.reloadData()
        }
            emojiFilter.setImage(UIImage(named: "emoji4.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        self.journalCol.reloadData()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addbtn(_ sender: Any) {
    }
    
    @IBAction func filterBtn(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JournalFilterViewController") as! JournalFilterViewController
                self.addChild(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParent: self)
    }
    
    
}

extension JournalViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ListItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                self.performSegue(withIdentifier: "ShowDetails", sender: indexPath)

        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "ShowDetails" {
                    if let indexPaths = journalCol.indexPathsForSelectedItems{
                        let destinationController = segue.destination as! JournalDetailsViewController
                        destinationController.selectedNote = ListItem[indexPaths[0].row]
                        journalCol.deselectItem(at: indexPaths[0], animated: false)
                    }
                }
            }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = journalCol.dequeueReusableCell(withReuseIdentifier: celliD, for: indexPath) as! JournalCollectionViewCell
    
    cell.layer.cornerRadius = 20
    let info = ListItem[indexPath.row]
    print("abc")
    if let moodimg = UIImage(data: info.image! as Data){
        
    cell.coverimage?.image = moodimg
       
    }
      
        cell.title?.text = info.text
        let dateFormatterPrint = DateFormatter()
                        dateFormatterPrint.dateFormat = "dd MMM"
                        dateFormatterPrint.string(from: info.date!)
        cell.datefield?.text = dateFormatterPrint.string(from: info.date!)
    
        return cell
    
    }
    
}
    
