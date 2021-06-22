//
//  Constants.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit

enum Constants {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let context = appDelegate.persistentContainer.viewContext
    
    enum CellIds {
        static let category = "CategoryCell"
    }
}
