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
    var delegate: AddAnItemDelegate?

    init(delegate: AddAnItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func addNewItem() {
        let name = nameField!.text
        let calorie = Double((caloriesField!.text)!)
        if(name == nil || calorie == nil) {
            return
        }
        let item = Item(name: name!, calories: calorie!)
        delegate?.add(item)
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}
