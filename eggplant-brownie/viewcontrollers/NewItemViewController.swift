//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli on 04/05/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?

    @IBAction func addNewItem() {
        let name = nameField!.text
        let calorie = Double((caloriesField!.text)!)
        if(name == nil || calorie == nil) {
            return
        }
        let item = Item(name: name!, calories: calorie!)
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}
