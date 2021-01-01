import UIKit

// MARK: Writing functions
func printHelp() {
    let message = """
Welcome to MyApp!
    
Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    print(message)
}

printHelp()

// MARK: Accepting Parameters
func square(number: Int) {
    print(number * number)
}

square(number: 8)

// MARK: Returning Values
func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)

// MARK: Parameter Labels
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

// MARK: Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor!")

// MARK: Default Parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("Taylor")
greet("Taylor", nicely: false)

// MARK: Variadic functions
print("Haters", "Gonna", "Hate")

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1,2,3,4,5)

// MARK: Writing throwing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

// MARK: Running throwing functions
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password!")

}

// MARK: inout parameters
// Can be changed inside function. Changes reflect outside
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
print(myNum)
