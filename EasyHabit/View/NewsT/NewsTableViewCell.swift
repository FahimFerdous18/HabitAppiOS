//
//  NewsTableViewCell.swift
//  EasyHabit
//
//  Created by BJIT on 1/26/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var datee: UILabel!
    @IBOutlet weak var proimg: UIImageView!
    @IBOutlet weak var headl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
