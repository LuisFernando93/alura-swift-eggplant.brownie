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
    let items = Array<Item>()
    
    init(name: String, happiness: Int) {
        self.name = name;
        self.happiness = happiness;
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}
