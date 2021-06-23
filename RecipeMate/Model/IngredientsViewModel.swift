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
        carrots.image = UIImage(named: "carrots")
        
        let celery = Ingredient(context: Constants.context)
        celery.name = "Celery"
        celery.image = UIImage(named: "celery")
        
        let beets = Ingredient(context: Constants.context)
        beets.name = "Beets"
        beets.image = UIImage(named: "beets")
        
        let kale = Ingredient(context: Constants.context)
        kale.name = "Kale"
        kale.image = UIImage(named: "kale")
        
        let potato = Ingredient(context: Constants.context)
        potato.name = "Potato"
        potato.image = UIImage(named: "potato")
        
        let bokChoy = Ingredient(context: Constants.context)
        bokChoy.name = "Bok Choy"
        bokChoy.image = UIImage(named: "bokchoy")
        
        let radish = Ingredient(context: Constants.context)
        radish.name = "Radish"
        radish.image = UIImage(named: "radish")
        
        let asparagus = Ingredient(context: Constants.context)
        asparagus.name = "Asparagus"
        asparagus.image = UIImage(named: "asparagus")
        
        let zucchini = Ingredient(context: Constants.context)
        zucchini.name = "Zucchini"
        zucchini.image = UIImage(named: "zucchini")
        
        let broccoli = Ingredient(context: Constants.context)
        broccoli.name = "Broccoli"
        broccoli.image = UIImage(named: "broccoli")
        
        let salt = Ingredient(context: Constants.context)
        salt.name = "Salt"
        salt.image = UIImage(named: "salt")
        
        let pepper = Ingredient(context: Constants.context)
        pepper.name = "Pepper"
        pepper.image = UIImage(named: "pepper")
        
        let crushedRedPepper = Ingredient(context: Constants.context)
        crushedRedPepper.name = "Crushed Red Pepper"
        crushedRedPepper.image = UIImage(named: "crushedredpepper")
        
        let cumin = Ingredient(context: Constants.context)
        cumin.name = "Cumin"
        cumin.image = UIImage(named: "cumin")
        
        let coriander = Ingredient(context: Constants.context)
        coriander.name = "Coriander"
        coriander.image = UIImage(named: "coriander")
        
        let garlicPowder = Ingredient(context: Constants.context)
        garlicPowder.name = "Garlic Powder"
        garlicPowder.image = UIImage(named: "garlicpowder")
        
        let onionPowder = Ingredient(context: Constants.context)
        onionPowder.name = "Onion Powder"
        onionPowder.image = UIImage(named: "onionpowder")
        
        let celerySalt = Ingredient(context: Constants.context)
        celerySalt.name = "Celery Salt"
        celerySalt.image = UIImage(named: "celerysalt")
        
        let cayennePepper = Ingredient(context: Constants.context)
        cayennePepper.name = "Cayenne Pepper"
        cayennePepper.image = UIImage(named: "cayennepepper")
        
        let onion = Ingredient(context: Constants.context)
        onion.name = "Onion"
        onion.image = UIImage(named: "onion")
        
        let bellPepper = Ingredient(context: Constants.context)
        bellPepper.name = "Bell Pepper"
        bellPepper.image = UIImage(named: "bellpepper")
        
        let shallot = Ingredient(context: Constants.context)
        shallot.name = "Shallot"
        shallot.image = UIImage(named: "shallot")
        
        let scallion = Ingredient(context: Constants.context)
        scallion.name = "Scallion"
        scallion.image = UIImage(named: "scallion")
        
        let chive = Ingredient(context: Constants.context)
        chive.name = "Chive"
        chive.image = UIImage(named: "chives")
        
        let parsley = Ingredient(context: Constants.context)
        parsley.name = "Parsley"
        parsley.image = UIImage(named: "parsley")
        
        let cilantro = Ingredient(context: Constants.context)
        cilantro.name = "Cilantro"
        cilantro.image = UIImage(named: "cilantro")
        
        let basil = Ingredient(context: Constants.context)
        basil.name = "Basil"
        basil.image = UIImage(named: "basil")
        
        let lemongrass = Ingredient(context: Constants.context)
        lemongrass.name = "Lemongrass"
        lemongrass.image = UIImage(named: "lemongrass")
        
        let thyme = Ingredient(context: Constants.context)
        thyme.name = "Thyme"
        thyme.image = UIImage(named: "thyme")
        
        let groundTurkey = Ingredient(context: Constants.context)
        groundTurkey.name = "Ground Turkey"
        groundTurkey.image = UIImage(named: "groundturkey")
        
        let porkShoulder = Ingredient(context: Constants.context)
        porkShoulder.name = "Pork Shoulder"
        porkShoulder.image = UIImage(named: "porkshoulder")
        
        let prawns = Ingredient(context: Constants.context)
        prawns.name = "Prawns"
        prawns.image = UIImage(named: "prawns")
        
        let halibut = Ingredient(context: Constants.context)
        halibut.name = "Halibut"
        halibut.image = UIImage(named: "halibut")
        
        let salmon = Ingredient(context: Constants.context)
        salmon.name = "Salmon"
        salmon.image = UIImage(named: "salmon")
        
        let cod = Ingredient(context: Constants.context)
        cod.name = "Cod"
        cod.image = UIImage(named: "cod")
        
        let chickenTenderlion = Ingredient(context: Constants.context)
        chickenTenderlion.name = "Chicken Tenderlion"
        chickenTenderlion.image = UIImage(named: "chickentenderloin")
        
        let porkChop = Ingredient(context: Constants.context)
        porkChop.name = "Pork Chop"
        porkChop.image = UIImage(named: "porkchop")
        
        let porkLoin = Ingredient(context: Constants.context)
        porkLoin.name = "Pork Loin"
        porkLoin.image = UIImage(named: "porkloin")
        
        let flankSteak = Ingredient(context: Constants.context)
        flankSteak.name = "Flank Steak"
        flankSteak.image = UIImage(named: "flanksteak")
        
        let heavyCream = Ingredient(context: Constants.context)
        heavyCream.name = "Heavy Cream"
        heavyCream.image = UIImage(named: "heavycream")
        
        let butter = Ingredient(context: Constants.context)
        butter.name = "Butter"
        butter.image = UIImage(named: "butter")
        
        let oliveOil = Ingredient(context: Constants.context)
        oliveOil.name = "Olive Oil"
        oliveOil.image = UIImage(named: "oliveoil")
        
        let vinegar = Ingredient(context: Constants.context)
        vinegar.name = "Vinegar"
        vinegar.image = UIImage(named: "vinegar")
        
        let redWineVinegar = Ingredient(context: Constants.context)
        redWineVinegar.name = "Red Wine Vinegar"
        redWineVinegar.image = UIImage(named: "redwinevinegar")
        
        let whiteWineVinegar = Ingredient(context: Constants.context)
        whiteWineVinegar.name = "White Wine Vinegar"
        whiteWineVinegar.image = UIImage(named: "whitewinevinegar")
        
        let soySauce = Ingredient(context: Constants.context)
        soySauce.name = "Soy Sauce"
        soySauce.image = UIImage(named: "soysauce")
        
        let chickenBroth = Ingredient(context: Constants.context)
        chickenBroth.name = "Chicken Broth"
        chickenBroth.image = UIImage(named: "chickenbroth")
        
        let chickenStock = Ingredient(context: Constants.context)
        chickenStock.name = "Chicken Stock"
        chickenStock.image = UIImage(named: "chickenstock")
        
        let boneBroth = Ingredient(context: Constants.context)
        boneBroth.name = "Bone Broth"
        boneBroth.image = UIImage(named: "bonebroth")
        
        let parmesanCheese = Ingredient(context: Constants.context)
        parmesanCheese.name = "Parmesan Cheese"
        parmesanCheese.image = UIImage(named: "parmesancheese")
        
        let ricottaCheese = Ingredient(context: Constants.context)
        ricottaCheese.name = "Ricotta Cheese"
        ricottaCheese.image = UIImage(named: "ricottacheese")
        
        let mozzarellaCheese = Ingredient(context: Constants.context)
        mozzarellaCheese.name = "Mozzarella Cheese"
        mozzarellaCheese.image = UIImage(named: "mozzarellacheese")
        
        let pankoBreadcrumbs = Ingredient(context: Constants.context)
        pankoBreadcrumbs.name = "Panko Breadcrumbs"
        pankoBreadcrumbs.image = UIImage(named: "pankobreadcrumbs")
        
        let creamCheese = Ingredient(context: Constants.context)
        creamCheese.name = "Cream Cheese"
        creamCheese.image = UIImage(named: "creamcheese")
        
        let eggs = Ingredient(context: Constants.context)
        eggs.name = "Eggs"
        eggs.image = UIImage(named: "eggs")
        
        let bacon = Ingredient(context: Constants.context)
        bacon.name = "Bacon"
        bacon.image = UIImage(named: "bacon")
        
        
        Constants.appDelegate.saveContext()
    }
}
