import UIKit

// MARK: Creating your own structs

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

// MARK: Computed Properties
struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// MARK: Property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 50
progress.amount = 80

// MARK: Methods
// Struct have function as they need to
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

// MARK: Mutating methods
struct Person {
    var name: String
    
    // By default Swift wont let you write methods
    // that change properties unless you specifically request it
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()

let nonVarPerson = Person(name: "Hello")
// nonVarPerson.makeAnonymous()

// MARK: Properties and methods of Strings
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// MARK: Properties and methods of arrays
var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())
toys.remove(at: 0)
