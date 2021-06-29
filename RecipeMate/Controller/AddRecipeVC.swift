//
//  AddRecipeVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/24/21.
//
import UIKit
import CoreData

protocol AddRecipeVCDelegate: AnyObject {
    func cancelButtonTapped()
    func recipeCreated(_ recipe: Recipe)
}

class AddRecipeVC: UIViewController {
    
    @IBOutlet weak var addRecipeView: UIView!
    @IBOutlet weak var saveRecipeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var instructionsTextField: UITextField!
    @IBOutlet weak var prepTimeTextField: UITextField!
    @IBOutlet weak var imageThumbView: UIImageView!
    
    var controller: NSFetchedResultsController<Ingredient>!
    let imagePicker = UIImagePickerController()
    
    let ingredientsViewModel = IngredientsViewModel()
    var viewModel = AddRecipeViewModel()
    
    weak var delegate: AddRecipeVCDelegate?
    
    var category: Category!
    var ingredientsList = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    var isSelectedForRecipe = [Bool]()
    var recipeToEdit: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        imagePicker.delegate = self
        
        initializeIngredients()
        
        addRecipeView.layer.cornerRadius = 10
        saveRecipeButton.layer.cornerRadius = 10
        tableView.layer.cornerRadius = 10
        imageThumbView.layer.cornerRadius = imageThumbView.frame.width / 2
        saveRecipeButton.isEnabled = false
        
        if recipeToEdit != nil {
            print(recipeToEdit)
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonTapped()
    }
    
    @IBAction func addImageButtonTapped(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if sender == recipeNameTextField {
            viewModel.recipeName = sender.text
        } else if sender == descriptionTextField {
            viewModel.descriptionName = sender.text
        } else if sender == instructionsTextField {
            viewModel.instructions = sender.text
        } else {
            viewModel.prepTime = sender.text
        }
        checkFormStatus()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        _ = ingredientsList.map { ingredient in
            if ingredient.isSelectedForRecipe {
                selectedIngredients.append(ingredient)
                ingredient.isSelectedForRecipe = false
            }
        }
        
        let createdRecipe = Recipe(context: Constants.context)
        createdRecipe.name = recipeNameTextField.text
        createdRecipe.details = descriptionTextField.text
        createdRecipe.instructions = instructionsTextField.text
        createdRecipe.prepTime = prepTimeTextField.text
        createdRecipe.category = category
        createdRecipe.image = imageThumbView.image ?? UIImage(named: "placeholder")
        createdRecipe.ingredients = NSSet(array: selectedIngredients)
        Constants.appDelegate.saveContext()
        delegate?.recipeCreated(createdRecipe)
    }
    
    func checkFormStatus() {
        if viewModel.formIsValid {
            saveRecipeButton.isEnabled = true
            saveRecipeButton.backgroundColor = .systemIndigo
        } else {
            saveRecipeButton.isEnabled = false
            saveRecipeButton.backgroundColor = .lightGray
        }
    }

}

extension AddRecipeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
//        let ingredient = ingredientsList[indexPath.row]
//        ingredient.isSelectedForRecipe = true
//        selectedIngredients.append(ingredient)
        ingredientsList[indexPath.row].isSelectedForRecipe = true
        cell?.accessoryType = .checkmark
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
//        let ingredient = ingredientsList[indexPath.row]
//        ingredient.isSelectedForRecipe = false
//        selectedIngredients.remove(at: selectedIngredients.count - indexPath.row - 1)
        ingredientsList[indexPath.row].isSelectedForRecipe = false
        cell?.accessoryType = .none
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.ingredient, for: indexPath) as? IngredientCell else { return UITableViewCell()}
        
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func configureCell(_ cell: IngredientCell, indexPath: IndexPath) {
        let ingredient = ingredientsList[indexPath.row]
        cell.configureCell(ingredient)
        
        if ingredient.isSelectedForRecipe {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

extension AddRecipeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageThumbView.image = image
        }
        picker.dismiss(animated: true)
    }
}

extension AddRecipeVC: NSFetchedResultsControllerDelegate {
    
    func initializeIngredients() {
        let fetchRequest: NSFetchRequest<Ingredient> = Ingredient.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [nameSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Constants.context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        if controller.fetchedObjects?.count == 0 {
            ingredientsViewModel.generateIngredients()
            
        }
        
        ingredientsList = controller.fetchedObjects ?? [Ingredient]()
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
