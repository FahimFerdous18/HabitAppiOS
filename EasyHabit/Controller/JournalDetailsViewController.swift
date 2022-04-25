//
//  JournalDetailsViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/28/22.
//

import UIKit

class JournalDetailsViewController: UIViewController {
    var selectedNote: Journal? = nil

    @IBOutlet weak var dayy: UILabel!
    @IBOutlet weak var newsDetail: UITextView!
    @IBOutlet weak var headLine: UILabel!
    @IBOutlet weak var imgcover: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let moodimg = UIImage(data: (selectedNote?.image as Data?)!){
            imgcover.image = moodimg
                }
               headLine.text = selectedNote?.text
               //dayy.text = selectedNote?.date
              newsDetail.text = selectedNote?.details
        
        let dateFormatterPrint = DateFormatter()
                        dateFormatterPrint.dateFormat = "dd MMM"
        dateFormatterPrint.string(from: selectedNote!.date!)
        dayy?.text = dateFormatterPrint.string(from: selectedNote!.date!)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
    }
    

}
