//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli Amaral de Abreu on 18/03/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var nameField: UITextField?;
    @IBOutlet var happinessField: UITextField?;
    var delegate: AddAMealDelegate?
    var selected: Array<Item> = []
    
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Zucchini", calories: 10),
        Item(name: "Muffin", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000),
    ]
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getURLItems() -> URL {
        return getDocumentsDirectory().appendingPathComponent("items_info.dados")
    }
    
    func saveItems() {
        do {
            let path = getURLItems()
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func loadItems() {
        do {
            let data = try Data(contentsOf: getURLItems())
            if let savedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Item> {
                items = savedItems
            }
        } catch {
            print("Couldn't read file.")
        }
    }
    
    func add(_ item: Item) {
        items.append(item)
        saveItems()
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show(message: "Unable to update table")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        loadItems()
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == UITableViewCell.AccessoryType.none{
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = items[indexPath.row]
                selected.append(item)
            }else{
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = items[indexPath.row]
                if let position = selected.firstIndex(of: item) {
                    selected.remove(at: position)
                } else {
                    Alert(controller: self).show()
                }
            }
        } else {
            Alert(controller: self).show()
        }
    }
    
    func convertToInt(_ texto: String?) -> Int? {
        if let texto = texto {
            if let numero = Int(texto) {
                return numero
            }
        }
        return nil
    }
    
    func getMealFromForm() -> Meal? {
        
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text) {
                let meal = Meal(name: name, happiness: happiness, items: selected)
                print("Eaten \(meal.name), with happiness \(meal.happiness) and itens: \(meal.items)")
                return meal
            }
        }
        return nil
    }
    
    @IBAction func add() {
        
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
}

