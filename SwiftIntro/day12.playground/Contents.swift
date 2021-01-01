import UIKit

// MARK: Handling missing data

var age: Int? = nil
// This doesn't hold any number, it holds nothing
age = 38

// MARK: Unwrapping optionals
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("missing name")
}

// MARK: Unwrapping with guard
// Major difference, unwrapped optional remains usable after guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    // Happy path!
    
    print("Hello, \(unwrapped)!")
}

// MARK: Force unwrapping
// When you know for sure!

let str = "5"
let num = Int(str)!

// MARK: Implicitly unwrapped optionals
let age2: Int! = nil

// They behave as if already unwrapped, don't need `if let` or `guard let`. If you try to use them
// and they have no value, then your code crashes

// MARK: Nil Coalescing
// Unwraps an optional and returns the value inside if there is one, otherwise use a default value
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

// The nil will coalesce to anonymous
let user = username(for: 15) ?? "Anonymous"

// MARK: Optional Chaining
// Use question mark for optional chaining

let names = ["John", "Paul", "George", "Ringo"]
// The first property can return one thing or nil if empty
let beatles = names.first?.uppercased()

// MARK: Optional Try
// Old code to check password
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// Two alternatives to try
// `try?` will change throwing function into functions that return an optional
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// An alternative if we are sure:
try! checkPassword("sekrit")
print("Ok!")

// Failable Initializers
let str2 = "5"
let num2 = Int(str2) // Is actually a failable initializer

struct Person {
    var id: String
    
    // Return nil if something goes wrong
    // But otherwise return will be the optional of my type
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// MARK: Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
