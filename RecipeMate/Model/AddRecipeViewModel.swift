//
//  AddRecipeViewModel.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/24/21.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct AddRecipeViewModel: AuthenticationProtocol {
    var recipeName: String?
    var descriptionName: String?
    var instructions: String?
    var prepTime: String?
    
    var formIsValid: Bool {
        return recipeName?.isEmpty == false && descriptionName?.isEmpty == false && instructions?.isEmpty == false && prepTime?.isEmpty == false
    }
}
