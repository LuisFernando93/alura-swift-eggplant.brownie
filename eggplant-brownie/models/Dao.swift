//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli on 21/06/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation

class Dao {
    
    let mealsUrl: URL
    let itemsUrl: URL
    
    init() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        mealsUrl = paths[0].appendingPathComponent("meals_info.dados")
        itemsUrl = paths[0].appendingPathComponent("items_info.dados")
    }
    
    func save(_ meals: Array<Meal>) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: mealsUrl)
        } catch {
            print("Couldn't write file.")
        }
    }
    
    func load() -> Array<Meal> {
        do {
            let data = try Data(contentsOf: mealsUrl)
            if let savedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) {
                let meals = savedMeals as! Array<Meal>
                return meals
            } else {
                return []
            }
        } catch {
            print("Couldn't read file.")
            return []
        }
    }
    
    func save(_ items: Array<Item>) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: itemsUrl)
        } catch {
            print("Couldn't write file.")
        }
    }
    
    func load() -> Array<Item> {
        do {
            let data = try Data(contentsOf: itemsUrl)
            if let savedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) {
                let items = savedItems as! Array<Item>
                return items
            } else {
                return []
            }
        } catch {
            print("Couldn't read file.")
            return []
        }
    }
}
