//
//  Constants.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit

enum Constants {
    static var materialKey: Bool = false
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let context = appDelegate.persistentContainer.viewContext
    
    enum CellIds {
        static let category = "CategoryCell"
        static let ingredient = "IngredientCell"
        static let recipe = "RecipeCell"
        
    }
    
    enum Segues {
        static let recipes = "RecipeSegue"
        static let addRecipe = "AddRecipeSegue"
    }
    
    enum CategoryImage {
        static let meat = UIImage(named: "Meat")!
        static let vegetarian = UIImage(named: "Vegetarian")!
        static let vegan = UIImage(named: "Vegan")!
        static let paleo = UIImage(named: "Paleo")!
        static let keto = UIImage(named: "Keto")!
    }
}

