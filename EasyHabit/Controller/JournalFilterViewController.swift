//
//  JournalFilterViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/28/22.
//

import UIKit

class JournalFilterViewController: UIViewController {
    var isActive = false

    @IBOutlet weak var sadBtn: UIButton!
    @IBOutlet weak var angryBtn: UIButton!
    @IBOutlet weak var fearBtn: UIButton!
    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var funBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        
    }
    
    @IBAction func sadAc(_ sender: Any)
    {
        if isActive {
                    isActive = false
            sadBtn.setImage(UIImage(named: "Vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    sadBtn.setImage(UIImage(named: "Vector-4.png"), for: .normal)
                }
                sleep(0)
                JournalFilter.sharevar.emoji = "sad"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "JournalViewController") as! JournalViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func angryAc(_ sender: Any)
    {
        if isActive {
                    isActive = false
            angryBtn.setImage(UIImage(named: "Vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    angryBtn.setImage(UIImage(named: "Vector-4.png"), for: .normal)
                }
                sleep(0)
                JournalFilter.sharevar.emoji = "angry"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "JournalViewController") as! JournalViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func fearAc(_ sender: Any) {
        if isActive {
                    isActive = false
            fearBtn.setImage(UIImage(named: "Vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    fearBtn.setImage(UIImage(named: "Vector-4.png"), for: .normal)
                }
                sleep(0)
                JournalFilter.sharevar.emoji = "fear"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "JournalViewController") as! JournalViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func happyAc(_ sender: Any) {
        if isActive {
                    isActive = false
            happyBtn.setImage(UIImage(named: "Vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    happyBtn.setImage(UIImage(named: "Vector-4.png"), for: .normal)
                }
                sleep(0)
                JournalFilter.sharevar.emoji = "happy"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "JournalViewController") as! JournalViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func funAc(_ sender: Any) {
        if isActive {
                    isActive = false
            funBtn.setImage(UIImage(named: "Vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    funBtn.setImage(UIImage(named: "Vector-4.png"), for: .normal)
                }
                sleep(0)
                JournalFilter.sharevar.emoji = "fun"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "JournalViewController") as! JournalViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
}
