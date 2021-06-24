//
//  AddRecipeVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/24/21.
//

import UIKit

protocol AddRecipeVCDelegate: AnyObject {
    func cancelButtonTapped()
}

class AddRecipeVC: UIViewController {
    
    @IBOutlet weak var addRecipeView: UIView!
    @IBOutlet weak var saveRecipeButton: UIButton!
    
    weak var delegate: AddRecipeVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        addRecipeView.layer.cornerRadius = 10
        saveRecipeButton.layer.cornerRadius = 10
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonTapped()
    }

}
