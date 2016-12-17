//
//  Meal.swift
//  FoodTracker
//
//  Created by koudai on 2016/11/29.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    //MARK: propties
    var name: String
    var image: UIImage?
    var rating: Int
    
    //MARK: Archieving Paths
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.image = photo
        self.rating = rating
        
        super.init()
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(image, forKey: PropertyKey.photoKey)
        aCoder.encode(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let image = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.ratingKey)
        
        self.init(name: name, photo: image, rating: rating)
    }
}
