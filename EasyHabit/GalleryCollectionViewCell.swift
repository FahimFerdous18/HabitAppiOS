//
//  GalleryCollectionViewCell.swift
//  EasyHabit
//
//  Created by BJIT on 1/25/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    //static let cellID = "galleryCollectionView"
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
