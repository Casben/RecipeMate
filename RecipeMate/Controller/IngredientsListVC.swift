//
//  IngredientsVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit
import CoreData

protocol AddAndEditIngredientDelegate: AnyObject {
    func ingredientChangesComplete()
}

class IngredientsListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = IngredientsViewModel()
    var controller: NSFetchedResultsController<Ingredient>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        initializeIngredients()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddIngredientVC
        destination.delegate = self
        
        if segue.identifier == Constants.Segues.editIngredient {
            destination.ingredientToEdit = sender as? Ingredient
        }
    }
    
    @IBAction func addIngredientButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: Constants.Segues.addIngredient, sender: nil)
    }

}

extension IngredientsListVC: UITableViewDelegate, UITableViewDataSource {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.ingredient, for: indexPath) as? IngredientCell else { return UITableViewCell()}
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = controller.fetchedObjects, objects.count > 0 {
            let ingredient = objects[indexPath.row]
            performSegue(withIdentifier: Constants.Segues.editIngredient, sender: ingredient)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func configureCell(_ cell: IngredientCell, indexPath: IndexPath) {
        let ingredient = controller.object(at: indexPath)
        cell.configureCell(ingredient)
    }
}

extension IngredientsListVC: NSFetchedResultsControllerDelegate {
    
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
    }
    
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
                let cell = tableView.cellForRow(at: indexpath) as! IngredientCell
                configureCell(cell, indexPath: indexpath)
                
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

extension IngredientsListVC: AddAndEditIngredientDelegate {
    func ingredientChangesComplete() {
        dismiss(animated: true, completion: nil)
    }
}
