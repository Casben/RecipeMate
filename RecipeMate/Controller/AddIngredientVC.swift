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
    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var ingredientNameTextField: UITextField!
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var saveAndEditIngredientButton: UIButton!
    
    var viewModel = AddIngredientViewModel()
    weak var delegate: AddAndEditIngredientDelegate?
    let imagePicker = UIImagePickerController()
    var ingredientToEdit: Ingredient?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        
        imagePicker.delegate = self
        
        addIngredientView.layer.cornerRadius = 10
        saveAndAddIngredientButton.layer.cornerRadius = 10
        ingredientImageView.layer.cornerRadius = 10
        optionsButton.isEnabled = false
        if ingredientToEdit != nil {
            prepareIngredientToBeEdited()
        }
    }
    
    func prepareIngredientToBeEdited() {
        saveAndAddIngredientButton.isEnabled = true
        saveAndAddIngredientButton.backgroundColor = .systemIndigo
        optionsButton.isEnabled = true
        
        ingredientImageView.image = ingredientToEdit?.image as? UIImage
        ingredientNameTextField.text = ingredientToEdit?.name
    }
    
    func checkFormStatus() {
        if viewModel.formIsValid {
            saveAndEditIngredientButton.isEnabled = true
            saveAndEditIngredientButton.backgroundColor = .systemIndigo
        } else {
            saveAndEditIngredientButton.isEnabled = false
            saveAndEditIngredientButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.ingredientChangesComplete()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        viewModel.ingredientName = sender.text
        checkFormStatus()
    }
    
    @IBAction func addImageButtonTapped(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }

}

extension AddIngredientVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            ingredientImageView.image = image
        }
        picker.dismiss(animated: true)
    }
}
