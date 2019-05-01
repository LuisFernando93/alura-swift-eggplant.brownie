//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli on 01/05/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    
    let meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 3),
                 Meal(name: "Daniela's Cheesecake", happiness: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        return cell
    }
}
