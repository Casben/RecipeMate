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
    @IBOutlet weak var navItem: UINavigationItem!
    
    let searchController = UISearchController(searchResultsController: nil)
    var controller: NSFetchedResultsController<NSFetchRequestResult>!
    
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
        navItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "What are you looking for?"
        definesPresentationContext = true
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = .systemIndigo
            textfield.backgroundColor = .white
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
            print("recipes should load")
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
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        controller = nil
        fetchItems()
        tableView.reloadData()
    }
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
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
        fetchItems()
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
