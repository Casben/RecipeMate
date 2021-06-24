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
    
    func configureCell(_ recipe: Recipe) {
        ingredientImageView.image = recipe.image as? UIImage
        ingredientLabel.text = recipe.name
        
        ingredientImageView.layer.cornerRadius = 10
        materialView.layer.cornerRadius = 10
    }

}
