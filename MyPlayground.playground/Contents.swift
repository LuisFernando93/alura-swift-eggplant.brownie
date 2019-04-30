import UIKit

var str = "Hello, playground"

class Meal {
    var happiness: Int;
    var name: String;
    var items = Array<Item>()
    
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

class Item {
    
    var name: String
    var calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
}

let brownie = Meal(name: "Brownie", happiness: 5)

let item1 = Item(name: "Brownie", calories: 100.50)
let item2 = Item(name: "Vegan Cream", calories: 85.6)

brownie.items.append(item1)
brownie.items.append(item2)

print(brownie.allCalories())
