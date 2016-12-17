//
//  TableViewCell.swift
//  SwiftStudyPlayLocalVideo
//
//  Created by koudai on 2016/11/27.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var onButtonTapped : (() -> Void)? = nil
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var videoTimeLabel: UILabel!
    @IBOutlet weak var videoNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tapToPlayVedio(_ sender: UIButton) {
        if let onButtonTapped = self.onButtonTapped {
            onButtonTapped()
        }
    }
    
}
