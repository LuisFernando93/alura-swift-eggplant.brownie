//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli Amaral de Abreu on 22/03/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding{
    let happiness: Int;
    let name: String;
    let items: Array<Item>
    
    init(name: String, happiness: Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness = aDecoder.decodeInteger(forKey: "happiness")
        self.items = aDecoder.decodeObject(forKey: "items") as! Array<Item>
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness)"
        for item in items {
            message += "\n" + item.details()
        }
        return message
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(items, forKey: "items")
    }
}
