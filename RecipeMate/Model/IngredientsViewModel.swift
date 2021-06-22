//
//  IngredientsViewModel.swift
//  RecipeMate
//
//  Created by Herbert Dodge on 6/22/21.
//

import UIKit

struct IngredientsViewModel {
    
    func generateIngredients() {
        
        let groundBeef = Ingredient(context: Constants.context)
        groundBeef.name = "Ground Beef"
        groundBeef.image = UIImage(named: "groundbeef")
        
        let carrots = Ingredient(context: Constants.context)
        carrots.name = "Carrots"
        
        let celery = Ingredient(context: Constants.context)
        celery.name = "Celery"
        
        let beets = Ingredient(context: Constants.context)
        beets.name = "Beets"
        
        let kale = Ingredient(context: Constants.context)
        kale.name = "Kale"
        
        let potato = Ingredient(context: Constants.context)
        potato.name = "Potato"
        
        let bokChoy = Ingredient(context: Constants.context)
        bokChoy.name = "Bok Choy"
        
        let radish = Ingredient(context: Constants.context)
        radish.name = "Radish"
        
        let asparagus = Ingredient(context: Constants.context)
        asparagus.name = "Asparagus"
        
        let zucchini = Ingredient(context: Constants.context)
        zucchini.name = "Zucchini"
        
        let broccoli = Ingredient(context: Constants.context)
        broccoli.name = "Brocoli"
        
        let salt = Ingredient(context: Constants.context)
        salt.name = "Salt"
        
        let pepper = Ingredient(context: Constants.context)
        pepper.name = "Pepper"
        
        let crushedRedPepper = Ingredient(context: Constants.context)
        crushedRedPepper.name = "Crushed Red Pepper"
        
        let cumin = Ingredient(context: Constants.context)
        cumin.name = "Cumin"
        
        let coriander = Ingredient(context: Constants.context)
        coriander.name = "Coriander"
        
        let garlicPowder = Ingredient(context: Constants.context)
        garlicPowder.name = "Garlic Powder"
        
        let onionPowder = Ingredient(context: Constants.context)
        onionPowder.name = "Onion Powder"
        
        let celerySalt = Ingredient(context: Constants.context)
        celerySalt.name = "Celery Salt"
        
        let cayennePepper = Ingredient(context: Constants.context)
        cayennePepper.name = "Cayenne Pepper"
        
        let onion = Ingredient(context: Constants.context)
        onion.name = "Onion"
        
        let bellPepper = Ingredient(context: Constants.context)
        bellPepper.name = "Bell Pepper"
        
        let shallot = Ingredient(context: Constants.context)
        shallot.name = "Shallot"
        
        let scallion = Ingredient(context: Constants.context)
        scallion.name = "Scallion"
        
        let chive = Ingredient(context: Constants.context)
        chive.name = "Chive"
        
        let parsley = Ingredient(context: Constants.context)
        parsley.name = "Parsley"
        
        let cilantro = Ingredient(context: Constants.context)
        cilantro.name = "Cilantro"
        
        let basil = Ingredient(context: Constants.context)
        basil.name = "Basil"
        
        let lemongrass = Ingredient(context: Constants.context)
        lemongrass.name = "Lemongrass"
        
        let thyme = Ingredient(context: Constants.context)
        thyme.name = "Thyme"
        
        let groundTurkey = Ingredient(context: Constants.context)
        groundTurkey.name = "Ground Turkey"
        
        let porkShoulder = Ingredient(context: Constants.context)
        porkShoulder.name = "Pork Shoulder"
        
        let prawns = Ingredient(context: Constants.context)
        prawns.name = "Prawns"
        
        let halibut = Ingredient(context: Constants.context)
        halibut.name = "Halibut"
        
        let salmon = Ingredient(context: Constants.context)
        salmon.name = "Salmon"
        
        let cod = Ingredient(context: Constants.context)
        cod.name = "Cod"
        
        let chickenTenderlion = Ingredient(context: Constants.context)
        chickenTenderlion.name = "Chicken Tenderlion"
        
        let porkChop = Ingredient(context: Constants.context)
        porkChop.name = "Pork Chop"
        
        let porkLoin = Ingredient(context: Constants.context)
        porkLoin.name = "Pork Loin"
        
        let flankSteak = Ingredient(context: Constants.context)
        flankSteak.name = "Flank Steak"
        
        let heavyCream = Ingredient(context: Constants.context)
        heavyCream.name = "Heavy Cream"
        
        let butter = Ingredient(context: Constants.context)
        butter.name = "Butter"
        
        let oliveOil = Ingredient(context: Constants.context)
        oliveOil.name = "Olive Oil"
        
        let vinegar = Ingredient(context: Constants.context)
        vinegar.name = "Vinegar"
        
        let redWineVinegar = Ingredient(context: Constants.context)
        redWineVinegar.name = "Red Wine Vinegar"
        
        let whiteWineVinegar = Ingredient(context: Constants.context)
        whiteWineVinegar.name = "White Wine Vinegar"
        
        let soySauce = Ingredient(context: Constants.context)
        soySauce.name = "Soy Sauce"
        
        let chickenBroth = Ingredient(context: Constants.context)
        chickenBroth.name = "Chicken Broth"
        
        let chickenStock = Ingredient(context: Constants.context)
        chickenStock.name = "Chicken Stock"
        
        let boneBroth = Ingredient(context: Constants.context)
        boneBroth.name = "Bone Broth"
        
        let parmesanCheese = Ingredient(context: Constants.context)
        parmesanCheese.name = "Parmesan Cheese"
        
        let ricottaCheese = Ingredient(context: Constants.context)
        ricottaCheese.name = "Ricotta Cheese"
        
        let mozzarellaCheese = Ingredient(context: Constants.context)
        mozzarellaCheese.name = "Mozzarella Cheese"
        
        let pankBreadCrumbs = Ingredient(context: Constants.context)
        pankBreadCrumbs.name = "Panko Breadcrumbs"
        
        let creamCheese = Ingredient(context: Constants.context)
        creamCheese.name = "Cream Cheese"
        
        let eggs = Ingredient(context: Constants.context)
        eggs.name = "Eggs"
        
        let bacon = Ingredient(context: Constants.context)
        bacon.name = "Bacon"
        
        
        Constants.appDelegate.saveContext()
    }
}
