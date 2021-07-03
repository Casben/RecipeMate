//
//  AddIngredientViewModel.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 7/3/21.
//

import Foundation

struct AddIngredientViewModel {
    var ingredientName: String?
    
    var formIsValid: Bool {
        return ingredientName?.isEmpty == false
    }
    
    mutating func restoreState(_ ingredient: Ingredient) {
        ingredientName = ingredient.name
    }
}
