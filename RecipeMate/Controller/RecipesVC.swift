//
//  RecipesVC.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/23/21.
//

import UIKit

class RecipesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipeCategory: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        title = recipeCategory.name
    }

}

extension RecipesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
