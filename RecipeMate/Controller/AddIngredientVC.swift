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
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var saveAndEditIngredientButton: UIButton!
    
    
    weak var delegate: AddAndEditIngredientDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        addIngredientView.layer.cornerRadius = 10
        saveAndAddIngredientButton.layer.cornerRadius = 10
        
        optionsButton.isEnabled = false
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.ingredientChangesComplete()
    }
}
