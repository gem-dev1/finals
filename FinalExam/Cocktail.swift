//
//  Cocktail.swift
//  FinalExam
//
//  Created by user239796 on 4/19/24.
//

import Foundation
import UIKit

class Cocktail {
    var cocktailImage: UIImage?
    var cocktailName: String
    var cocktailId: String
    
    init(cocktailImage: UIImage? = nil, cocktailName: String, cocktailId: String) {
        self.cocktailImage = cocktailImage
        self.cocktailName = cocktailName
        self.cocktailId = cocktailId
    }
}
