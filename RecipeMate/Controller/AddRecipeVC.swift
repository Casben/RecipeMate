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
}

class AddRecipeVC: UIViewController {
    
    @IBOutlet weak var addRecipeView: UIView!
    @IBOutlet weak var saveRecipeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Ingredient>!
    let viewModel = IngredientsViewModel()
    weak var delegate: AddRecipeVCDelegate?
    
    var ingredientsList = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    var isSelectedForRecipe = [Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        initializeIngredients()
        addRecipeView.layer.cornerRadius = 10
        saveRecipeButton.layer.cornerRadius = 10
        tableView.layer.cornerRadius = 10
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonTapped()
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
        print("selected index is \(indexPath)")
        cell?.accessoryType = .checkmark
        
        print("selectedIngredients count is \(selectedIngredients.count)")
        
        
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
            viewModel.generateIngredients()
            
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
