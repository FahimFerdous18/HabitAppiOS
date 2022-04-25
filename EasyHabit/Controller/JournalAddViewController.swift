//
//  JournalAddViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/27/22.
//

import UIKit
import CoreData

class JournalAddViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextViewDelegate {
    var arrJournal = [Journal]()
    
    var btnvalue: String = ""

    @IBOutlet weak var chngBtn: UIButton!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var addDetail: UITextView!
    @IBOutlet weak var addimage: UIButton!
    @IBOutlet weak var covimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDetail.delegate = self
        addDetail.text = "Write something"
        addDetail.textColor = UIColor.lightGray
        chngBtn.isHidden = true

      
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            if addDetail.textColor == UIColor.lightGray {
                addDetail.text = nil
                addDetail.textColor = UIColor.black
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if addDetail.text.isEmpty {
                addDetail.text = "Write something"
                addDetail.textColor = UIColor.lightGray
            }
        }
    
    @IBAction func changeBtn(_ sender: Any)
    {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
    let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
               
    
        optionMenu.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera not avaiable")
            }
            
        }))
        optionMenu.addAction(UIAlertAction(title: "Choose from gallery", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        optionMenu.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          


           self.present(optionMenu, animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
            let saveData = NSEntityDescription.insertNewObject(forEntityName: "Journal", into: context) as! Journal
        
         saveData.text = titleText.text
         saveData.emoji = btnvalue
         let png = self.covimg.image?.pngData()
         saveData.image = png
         saveData.details = addDetail.text
        let date = Date()
        saveData.date = date
        
        //print(saveData.date as Any)
        
        do {
            try context.save()
            arrJournal.append(saveData)
            JournalFilter.sharevar.emoji = ""
            print("Sucessfully Saved")
        } catch let error {
            print(error.localizedDescription)
        }
        //navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func sademo(_ sender: Any)
    {
        btnvalue = "sad"
        
    }
    
    @IBAction func angryemo(_ sender: Any)
    {
        btnvalue = "angry"
    }
    
    @IBAction func fearemo(_ sender: Any) {
        btnvalue = "fear"
    }
    @IBAction func happyemo(_ sender: Any)
    {
        btnvalue = "happy"
    }
    @IBAction func funemo(_ sender: Any)
    {
        btnvalue = "fun"
    }
    
    @IBAction func addImage(_ sender: Any)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
    let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
               
    
        optionMenu.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera not avaiable")
            }
            
        }))
        optionMenu.addAction(UIAlertAction(title: "Choose from gallery", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        optionMenu.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          


           self.present(optionMenu, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        covimg.alpha = 1
        covimg.image = image
        picker.dismiss(animated: true, completion: nil)
        chngBtn.isHidden = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

