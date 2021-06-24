//
//  RecipesVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/23/21.
//

import UIKit
import CoreData

class RecipesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipeCategory: Category!
    var controller: NSFetchedResultsController<Recipe>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        initializeRecipes()
        title = recipeCategory.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.addRecipe {
            let destination = segue.destination as! AddRecipeVC
            destination.delegate = self
        }
    }
    
    @IBAction func addRecipeButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: Constants.Segues.addRecipe, sender: nil)
    }

}

extension RecipesVC: UITableViewDelegate, UITableViewDataSource {
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.recipe, for: indexPath) as? RecipeCell else { return UITableViewCell() }
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func configureCell(_ cell: RecipeCell, indexPath: IndexPath) {
        let category = controller.object(at: indexPath)
            let recipe = category
            cell.configureCell(recipe)
    }
}

extension RecipesVC: NSFetchedResultsControllerDelegate {
    
    func initializeRecipes() {
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        let predicate = NSPredicate(format: "category == %@", argumentArray: [recipeCategory!])
        
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [nameSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Constants.context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        //        if controller.fetchedObjects?.count == 0 {
        //            viewModel.generateCategories()
        //        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

extension RecipesVC: AddRecipeVCDelegate {
    func cancelButtonTapped() {
        dismiss(animated: true)
    }
}
