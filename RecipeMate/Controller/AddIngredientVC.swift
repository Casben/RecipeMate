//
//  IngredientVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 7/3/21.
//

import UIKit

class AddIngredientVC: UIViewController {
    
    @IBOutlet weak var addIngredientView: UIView!
    @IBOutlet weak var saveAndAddIngredientButton: UIButton!
    @IBOutlet weak var imageThumbView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        addIngredientView.layer.cornerRadius = 10
        saveAndAddIngredientButton.layer.cornerRadius = 10
    }
}
