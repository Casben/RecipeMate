//
//  CategoriesVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit
import CoreData

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CategoriesViewModel()
    var controller: NSFetchedResultsController<Category>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        intializeCategories()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.recipes {
            if let destination = segue.destination as? RecipesVC {
                if let category = sender as? Category {
                    destination.recipeCategory = category
                }
            }
        }
    }
    
}

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.category, for: indexPath) as? CategoryCell else { return UITableViewCell()}
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = controller.fetchedObjects, objects.count > 0 {
            let recipeCategory = objects[indexPath.row]
            performSegue(withIdentifier: Constants.Segues.recipes, sender: recipeCategory)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func configureCell(_ cell: CategoryCell, indexPath: IndexPath) {
        let category = controller.object(at: indexPath)
        cell.configureCell(category)
    }
    
}

extension CategoriesVC: NSFetchedResultsControllerDelegate {
    
    func intializeCategories() {
       let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
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
            viewModel.generateCategories()
        }
   }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
