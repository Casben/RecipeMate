//
//  CategoryCell.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var materialView: UIView!
    
    func configureCell(_ category: Category) {
        
        switch category.name {
        case "Meat":
            categoryImageView.image = Constants.CategoryImage.meat
        case "Vegetarian":
            categoryImageView.image = Constants.CategoryImage.vegetarian
        case "Vegan":
            categoryImageView.image = Constants.CategoryImage.vegan
        case "Paleo":
            categoryImageView.image = Constants.CategoryImage.paleo
        case "Keto":
            categoryImageView.image = Constants.CategoryImage.keto
        default:
            break
        }
        materialView.layer.cornerRadius = 10
        categoryImageView.layer.cornerRadius = 10
        categoryNameLabel.text = category.name
        
    }
   

}
