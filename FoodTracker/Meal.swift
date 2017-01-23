//
//  Meal.swift
//  FoodTracker
//
//  Created by Anirudh Ramanan on 19/01/17.
//  Copyright © 2017 Anirudh Ramanan. All rights reserved.
//

import Foundation
import UIKit

class Meal : NSObject, NSCoding {
    var name: String
    var mealImage : UIImage?
    var rating: Int
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    init?(name: String, mealImage: UIImage?, rating:Int) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard rating > 0 && rating <= 5 else {
            return nil
        }
        
        self.name = name
        self.mealImage = mealImage
        self.rating = rating
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(mealImage, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
     
        self.init(name: name, mealImage: photo, rating: rating)
    }
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
}
