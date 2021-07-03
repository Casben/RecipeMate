//
//  Ingredient+CoreDataProperties.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/29/21.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var isSelectedForRecipe: Bool
    @NSManaged public var name: String?
    @NSManaged public var recipe: NSSet?

}

// MARK: Generated accessors for recipe
extension Ingredient {

    @objc(addRecipeObject:)
    @NSManaged public func addToRecipe(_ value: Recipe)

    @objc(removeRecipeObject:)
    @NSManaged public func removeFromRecipe(_ value: Recipe)

    @objc(addRecipe:)
    @NSManaged public func addToRecipe(_ values: NSSet)

    @objc(removeRecipe:)
    @NSManaged public func removeFromRecipe(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
