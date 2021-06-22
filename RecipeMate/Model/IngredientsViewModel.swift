//
//  IngredientsViewModel.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit

struct IngredientsViewModel {
    
    func generateCategories() {
        
        let groundBeef = Ingredient(context: Constants.context)
        groundBeef.name = "Ground Beef"
        groundBeef.image = UIImage(named: "groundbeef")
        
        Constants.appDelegate.saveContext()
    }
}
