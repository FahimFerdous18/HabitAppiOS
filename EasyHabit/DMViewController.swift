//
//  DMViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/24/22.
//

import UIKit
import CoreData

class DMViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    var arrPhotos = [SaveInfo]()
    var people: [NSManagedObject] = []
    @IBOutlet weak var savebtn: UIButton!
    
    @IBOutlet weak var profileimg: UIImageView!
    @IBOutlet weak var addimgBtn: UIButton!
    
    @IBOutlet weak var note: UITextView!
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        note.delegate = self
        note.text = "Type something about your day"
        note.textColor = UIColor.lightGray
        savebtn.isEnabled = false
        
                
        profileimg.layer.cornerRadius = 75
                profileimg.layer.maskedCorners = [.layerMaxXMinYCorner]

        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            if note.textColor == UIColor.lightGray {
                note.text = nil
                note.textColor = UIColor.black
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if note.text.isEmpty {
                note.text = "Type something about your day"
                note.textColor = UIColor.lightGray
            }
        }
    
    @IBAction func saveInfo(_ sender: Any)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let photo = NSEntityDescription.insertNewObject(forEntityName: "SaveInfo", into: context) as! SaveInfo
        photo.text = note.text
        let png = self.profileimg.image?.pngData()
        photo.img = png
        
        do {
            try context.save()
            arrPhotos.append(photo)
            print("Sucessfully Saved")
        } catch let error {
            print(error.localizedDescription)
        }

 
    }
    
    func retriveImage()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SaveInfo")
        do {
            arrPhotos = try context.fetch(fetchRequest) as! [SaveInfo]
            if let photo = arrPhotos.last {
                profileimg.image = UIImage(data: photo.img!)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func ActionSheet(_ sender: Any) {
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
           //let chooseAction = UIAlertAction(title: "Choose from gallery", style: .default)


           self.present(optionMenu, animated: true, completion: nil)
       }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileimg.alpha = 1
        profileimg.image = image
        picker.dismiss(animated: true, completion: nil)
        savebtn.isEnabled = true
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
extension DMViewController {
    
}
    


