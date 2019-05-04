//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli on 04/05/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBAction func addNewItem() {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}
