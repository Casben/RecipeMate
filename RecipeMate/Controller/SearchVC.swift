//
//  SearchVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit
import CoreData

class SearchVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let searchController = UISearchController(searchResultsController: nil)
    var controller: NSFetchedResultsController<NSFetchRequestResult>!
    
    var filteredResults = [Any]()
    
    var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        configureSearchController()
        fetchItems()
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.showsCancelButton = false
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "What are you looking for?"
        definesPresentationContext = true
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = .systemIndigo
            textfield.backgroundColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.editIngredient {
            let destination = segue.destination as? AddIngredientVC
            destination?.ingredientToEdit = sender as? Ingredient
            destination?.delegate = self
        }
        
        if segue.identifier == Constants.Segues.editRecipe {
            let destination = segue.destination as? AddRecipeVC
            destination?.recipeToEdit = sender as? Recipe
            destination?.delegate = self
        }
    }

    
    func fetchItems() {
        var fetchRequest: NSFetchRequest<NSFetchRequestResult>!
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            fetchRequest = Ingredient.fetchRequest()
            let ingredientSort = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [ingredientSort]
        case 1:
            fetchRequest = Recipe.fetchRequest()
            let recipeNameSort = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [recipeNameSort]
        case 2:
            fetchRequest = Recipe.fetchRequest()
            let recipeDetailsSort = NSSortDescriptor(key: "details", ascending: true)
            fetchRequest.sortDescriptors = [recipeDetailsSort]
        case 3:
            fetchRequest = Recipe.fetchRequest()
            let recipeDetailsSort = NSSortDescriptor(key: "prepTime", ascending: true)
            fetchRequest.sortDescriptors = [recipeDetailsSort]
        case 4:
            fetchRequest = Recipe.fetchRequest()
            let recipeDetailsSort = NSSortDescriptor(key: "category", ascending: true)
            fetchRequest.sortDescriptors = [recipeDetailsSort]
        default:
            break
            
        }
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Constants.context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchItems(withQuery searchText: String) {
        var fetchRequest: NSFetchRequest<NSFetchRequestResult>!
        let namePredicate = NSPredicate(format: "name CONTAINS[cd] %@", searchText)
        let detailsPredicate = NSPredicate(format: "details CONTAINS[cd] %@", searchText)
        let prepToimePredicate = NSPredicate(format: "prepTime CONTAINS[cd] %@", searchText)
        let categoryPredicate = NSPredicate(format: "category.name CONTAINS[cd] %@", searchText)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            fetchRequest = Ingredient.fetchRequest()
            let ingredientSort = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [ingredientSort]
            fetchRequest.predicate = namePredicate
        case 1:
            fetchRequest = Recipe.fetchRequest()
            let recipeNameSort = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [recipeNameSort]
            fetchRequest.predicate = namePredicate
        case 2:
            fetchRequest = Recipe.fetchRequest()
            let recipeDetailsSort = NSSortDescriptor(key: "details", ascending: true)
            fetchRequest.sortDescriptors = [recipeDetailsSort]
            fetchRequest.predicate = detailsPredicate
        case 3:
            fetchRequest = Recipe.fetchRequest()
            let recipeDetailsSort = NSSortDescriptor(key: "prepTime", ascending: true)
            fetchRequest.sortDescriptors = [recipeDetailsSort]
            fetchRequest.predicate = prepToimePredicate
        case 4:
            fetchRequest = Recipe.fetchRequest()
            let recipeDetailsSort = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [recipeDetailsSort]
            fetchRequest.predicate = categoryPredicate
        default:
            break
            
        }
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Constants.context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        filteredResults = controller.fetchedObjects!
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        controller = nil
        fetchItems()
        filteredResults = []
        tableView.reloadData()
    }
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return filteredResults.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return filteredResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.ingredient, for: indexPath) as! IngredientCell
            configureIngredientCell(cell, indexPath: indexPath)
            return cell
        case 1, 2, 3, 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.recipe, for: indexPath) as! RecipeCell
            configureRecipeCell(cell, indexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = tableView.cellForRow(at: indexPath) as? IngredientCell {
            let ingredient = controller.object(at: indexPath) as? Ingredient
            performSegue(withIdentifier: Constants.Segues.editIngredient, sender: ingredient)
        } else if let _ = tableView.cellForRow(at: indexPath) as? RecipeCell {
            let recipe = controller.object(at: indexPath) as? Recipe
                performSegue(withIdentifier: Constants.Segues.editRecipe, sender: recipe)
            }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func configureIngredientCell(_ cell: IngredientCell, indexPath: IndexPath) {
        let ingredient = controller.object(at: indexPath)
        cell.configureCell(ingredient as! Ingredient)
    }
    
    func configureRecipeCell(_ cell: RecipeCell, indexPath: IndexPath) {
        let recipe = controller.object(at: indexPath)
        cell.configureCell(recipe as! Recipe)
    }
}

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else { return }
        fetchItems(withQuery: searchText)
        tableView.reloadData()
    }
}

extension SearchVC: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case.insert:
            if let indexpath = newIndexPath {
                tableView.insertRows(at: [indexpath], with: .fade)
            }
        case.delete:
            if let indexpath = indexPath {
                tableView.deleteRows(at: [indexpath], with: .fade)
            }
        case.update:
            if let indexpath = indexPath {
                if segmentedControl.selectedSegmentIndex == 0 {
                    let cell = tableView.cellForRow(at: indexpath) as! IngredientCell
                    configureIngredientCell(cell, indexPath: indexpath)
                } else {
                    let cell = tableView.cellForRow(at: indexpath) as! RecipeCell
                    configureRecipeCell(cell, indexPath: indexpath)
                }
            }
        case.move:
            if let indexpath = indexPath {
                tableView.insertRows(at: [indexpath], with: .fade)
            }
            
        @unknown default:
            break
        }
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

extension SearchVC: AddAndEditIngredientDelegate {
    func ingredientChangesComplete() {
        dismiss(animated: true)
    }
}

extension SearchVC: AddAndEditRecipeDelegate {
    func recipeChangesComplete() {
        dismiss(animated: true)
    }
    
    func recipeDuplicated(_ recipe: Recipe) {
        
    }
    
    
}
