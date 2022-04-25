//
//  GalleryViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/25/22.
//

import UIKit
import CoreData
var moodList = [SaveInfo]()

class GalleryViewController: UIViewController {
    var context: NSManagedObjectContext!
    
    let cellID = "galleryCollectionView"

    @IBOutlet weak var popBtn: UIButton!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let call : String = GalleryFilter.shareVar.timeD ?? "All time"
                popBtn.setTitle(call,for: .normal)
        
        
        self.galleryCollectionView.delegate = self
        self.galleryCollectionView.dataSource = self
        self.galleryCollectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        
        context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext

                let inforeq:NSFetchRequest<SaveInfo>=SaveInfo.fetchRequest()
                var request = NSFetchRequest<NSFetchRequestResult>()
                request = SaveInfo.fetchRequest()
                request.returnsObjectsAsFaults = false
                do {
                    moodList = try
                        context.fetch(inforeq)
                    self.galleryCollectionView.reloadData()

                }
                catch
                {
                    print("Fetch Failed")
                }

    }
    
    @IBAction func popAction(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GalleryFilterViewController") as! GalleryFilterViewController
                self.addChild(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParent: self)
    }
    


}
//extension GalleryViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return UserInfo.cellData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GalleryCollectionViewCell
//        cell.layer.cornerRadius = 20
//        cell.image.image = UIImage(named: UserInfo.cellData[indexPath.item].image)
//        cell.date.text = UserInfo.cellData[indexPath.item].date
//        return cell
//    }
//
//
//}

extension GalleryViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return moodList.count
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                self.performSegue(withIdentifier: "showDetails", sender: indexPath)

        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "showDetails" {
                    if let indexPaths = galleryCollectionView.indexPathsForSelectedItems{
                        let destinationController = segue.destination as! PhotoDetailViewController
                        destinationController.selectedNote = moodList[indexPaths[0].row]
                        galleryCollectionView.deselectItem(at: indexPaths[0], animated: false)
                    }
                }
            }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GalleryCollectionViewCell
        
        
        let info = moodList[indexPath.row]
        print("abc")
        if let moodimg = UIImage(data: info.img! as Data){
             
        cell.image?.image = moodimg
           
        }
           cell.date?.text = info.date
        
            return cell
        }
}


