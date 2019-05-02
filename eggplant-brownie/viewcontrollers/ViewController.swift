//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli Amaral de Abreu on 18/03/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?;
    @IBOutlet var happinessField: UITextField?;
    var delegate: ViewControllerDelegate?
    
    @IBAction func add() {
        
        if (nameField == nil || happinessField == nil) {
            return
        }
        
        let name: String = nameField!.text!;
        if let happiness = Int(happinessField!.text!) {
            
            let meal = Meal(name: name, happiness: happiness)
            print("eaten \(meal.name) with happiness \(meal.happiness)!")
            
            if (delegate == nil) {
                return
            }
            delegate?.add(meal)
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
            
        } else {
            print("insert a valid value for happiness")
        }
        
    }
    
}

