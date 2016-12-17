//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by koudai on 2016/11/29.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
