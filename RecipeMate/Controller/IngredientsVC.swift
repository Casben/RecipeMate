//
//  IngredientsVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit
import CoreData

class IngredientsVC: UIViewController {
    
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
        intializeCategories()
    }

}

extension IngredientsVC: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func configureCell(_ cell: IngredientCell, indexPath: IndexPath) {
        let ingredient = controller.object(at: indexPath)
        cell.configureCell(ingredient)
    }
}

extension IngredientsVC: NSFetchedResultsControllerDelegate {
    
    func intializeCategories() {
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
            viewModel.generateCategories()
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
}
