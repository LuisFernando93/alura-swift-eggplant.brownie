//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli on 01/05/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    
    var meals: Array<Meal> = []
    
    override func viewDidLoad() {
        self.meals = Dao().load()
    }
    
    
    func add(_ meal: Meal) { //o underline indica que no primeiro parametro nao precisa especificar o tipo
        meals.append(meal)
        Dao().save(meals)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(recognizer)
        
        cell.textLabel!.text = meal.name
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer) {
        if (recognizer.state == UIGestureRecognizer.State.began) {
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                RemoveMealController(controller: self).show(meal, handler: { action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                    })
            }
        }
    }
}
