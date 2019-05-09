//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Luis Fernando Pasquinelli Amaral de Abreu on 22/03/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation

class Meal {
    let happiness: Int;
    let name: String;
    let items: Array<Item>
    
    init(name: String, happiness: Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
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
}
