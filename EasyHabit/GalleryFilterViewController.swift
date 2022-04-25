//
//  GalleryFilterViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/25/22.
//

import UIKit

class GalleryFilterViewController: UIViewController {
    
    var isActive = false

  
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnac1(_ sender: Any)
    {
        if isActive {
                    isActive = false
                    btn1.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    btn1.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
        sleep(0)
                GalleryFilter.shareVar.timeD = "All time"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func btnac2(_ sender: Any) {
        if isActive {
                    isActive = false
                    btn2.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    btn2.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(0)
                GalleryFilter.shareVar.timeD = "Last 7 days"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func btnac3(_ sender: Any) {
        if isActive {
                    isActive = false
                    btn3.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    btn3.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(0)
                GalleryFilter.shareVar.timeD = "Last 15 days"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func btnac4(_ sender: Any) {
        if isActive {
                    isActive = false
                    btn4.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    btn4.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(0)
                GalleryFilter.shareVar.timeD = "Last 30 days"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func btnac5(_ sender: Any) {
        if isActive {
                    isActive = false
                    btn5.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    btn5.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(0)
                GalleryFilter.shareVar.timeD = "Today"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func btnac6(_ sender: Any) {
        if isActive {
                    isActive = false
                    btn6.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    btn6.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(0)
                GalleryFilter.shareVar.timeD = "Yesterday"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    
   

}
