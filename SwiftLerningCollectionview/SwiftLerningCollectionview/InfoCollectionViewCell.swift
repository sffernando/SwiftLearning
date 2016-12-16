//
//  InfoCollectionViewCell.swift
//  SwiftLerningCollectionview
//
//  Created by koudai on 2016/11/30.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    //MARK: properties
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoTextLabel: UILabel!
    
    var infoBean: InfoBean! {
        didSet {
            setUpData()
        }
    }
    
    func setUpData()  {
        infoImageView.image = infoBean.photo
        infoTextLabel.text = infoBean.info
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
