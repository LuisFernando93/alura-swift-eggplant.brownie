//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli on 07/06/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler)
        
        details.addAction(cancel)
        details.addAction(remove)
        
        controller.present(details, animated: true, completion: nil)
    }
}
