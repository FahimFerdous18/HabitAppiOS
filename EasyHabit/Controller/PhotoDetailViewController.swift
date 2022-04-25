//
//  PhotoDetailViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/26/22.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var selectedNote: SaveInfo? = nil

    @IBOutlet weak var moodText: UITextView!
    @IBOutlet weak var moodImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
                if(selectedNote != nil) //load from collection VC
                {
                    moodText.text = selectedNote?.text
                    if let moodimg = UIImage(data: (selectedNote?.img!)! as Data){
                    moodImg.image = moodimg
                        
                    }
                }

       
    }
    


}
