//
//  InfoBean.swift
//  SwiftLerningCollectionview
//
//  Created by koudai on 2016/11/30.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class InfoBean {
    var photo: UIImage
    var info: String
    
    init?(photo: UIImage, info: String) {
        if info.isEmpty {
            return nil
        }
        
        self.photo = photo
        self.info = info
    }
}
