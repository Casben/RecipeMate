//
//  CategoriesViewModel.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import Foundation


struct CategoriesViewModel {
    
    func generateCategories() {
        let meat = Category(context: Constants.context)
        meat.name = "Meat"
        
        let vegetarian = Category(context: Constants.context)
        vegetarian.name = "Vegetarian"
        
        let vegan = Category(context: Constants.context)
        vegan.name = "Vegan"
        
        let paleo = Category(context: Constants.context)
        paleo.name = "Paleo"
        
        let keto = Category(context: Constants.context)
        keto.name = "Keto"
        
        Constants.appDelegate.saveContext()
    }
}
