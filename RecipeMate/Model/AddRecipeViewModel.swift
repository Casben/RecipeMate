//
//  AddRecipeViewModel.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/24/21.
//

import Foundation

struct AddRecipeViewModel {
    var recipeName: String?
    var descriptionName: String?
    var instructions: String?
    var prepTime: String?
    
    var formIsValid: Bool {
        return recipeName?.isEmpty == false && descriptionName?.isEmpty == false && instructions?.isEmpty == false && prepTime?.isEmpty == false
        
    }
    
    mutating func restoreState(_ recipe: Recipe) {
        recipeName = recipe.name
        descriptionName = recipe.details
        instructions = recipe.instructions
        prepTime = recipe.prepTime
    }
}
