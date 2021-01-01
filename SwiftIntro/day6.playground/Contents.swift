import UIKit

// MARK: Creating basic closures
// Function without a name
let driving = {
    print("I'm driving in my car")
}
driving()

// MARK: Accepting parameters in a closure

let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

// Don't use parameter labels when calling closures
driving2("London")

// MARK: Returning values from a closure
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// MARK: Closures as parameters
// Basic closure:
/*
 let driving = {
   print("Something")
 }
 */

// () -> () seems to work too
func travel(action: () -> Void) {
    print("I'm getting ready")
    action()
    print("I arrived!")
}

// MARK: Trailing closure syntax
// If last parameter is closure, Swift lets you use special syntax
travel {
    print("I'm driving in my car")
}

// travel() {} works too

