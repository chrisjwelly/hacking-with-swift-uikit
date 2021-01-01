import UIKit

// MARK: Protocols
// Descibes what properties and methods something must have

/*
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
 */

// MARK: Protocol Inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

// Inherits from all 3, now just conform to `Employee` protocol instead of
// 3 individual ones
protocol Employee: Payable, NeedsTraining, HasVacation {}

// MARK: Extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()
// Must use computed properties

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

// MARK: Protocol Extensions

let pythons = ["E", "G", "J", "M", "T", "C"]
let beatles = Set(["J", "P", "G", "R"])


extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// MARK: Protocol-oriented programming
protocol Identifiable {
    var id: String { get set }
    func identify()
}

// Now we don't need to implement `identify` everywhere
extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
