//
//  Meal.swift
//  FoodTracker
//
//  Created by Anirudh Ramanan on 19/01/17.
//  Copyright © 2017 Anirudh Ramanan. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    var name: String
    var mealImage : UIImage?
    var rating: Int
    
    init?(name: String, mealImage: UIImage?, rating:Int) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard rating > 0 && rating < 5 else {
            return nil
        }
        
        self.name = name
        self.mealImage = mealImage
        self.rating = rating
    }
}
