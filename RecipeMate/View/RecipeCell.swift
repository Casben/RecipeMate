//
//  RecipeCell.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/23/21.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var materialView: UIView!
    
    func configureCell(_ ingredient: Ingredient) {
        ingredientImageView.image = ingredient.image as? UIImage
        ingredientLabel.text = ingredient.name
        
        ingredientImageView.layer.cornerRadius = 10
        materialView.layer.cornerRadius = 10
    }

}
