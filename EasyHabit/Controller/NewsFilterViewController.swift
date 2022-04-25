//
//  NewsFilterViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/26/22.
//

import UIKit

class NewsFilterViewController: UIViewController {
    var isActive = false

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        
    }
    
    @IBAction func ab1(_ sender: Any)
    {
        if isActive {
                    isActive = false
                    button1.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    button1.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(1)
                NewsFilter.sharedVar.timeeD = "All time"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func ab2(_ sender: Any)
    {
        if isActive {
                    isActive = false
                    button2.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    button2.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(1)
                NewsFilter.sharedVar.timeeD = "All time"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func ab3(_ sender: Any)
    {
        if isActive {
                    isActive = false
                    button3.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    button3.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(1)
                NewsFilter.sharedVar.timeeD = "All time"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func ab4(_ sender: Any)
    {
        if isActive {
                    isActive = false
                    button4.setImage(UIImage(named: "vector-5.png"), for: .normal)
                }
                else{
                    isActive = true
                    button4.setImage(UIImage(named: "vector-4.png"), for: .normal)
                }
                sleep(1)
                NewsFilter.sharedVar.timeeD = "All time"
                
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
                
                self.present(newViewController, animated: true, completion: nil)
    }
    
}
