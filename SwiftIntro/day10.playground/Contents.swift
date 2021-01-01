import UIKit

// MARK: Creating your own classes
/*
class Dog {
    var name: String
    var breed: String
    
    // Note: Classes don't come with a memberwise initializer. If you have properties
    // in your class, must always create your own initializer
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")
 */

// MARK: Class inheritance
/*
class Poodle: Dog {
    init(name: String) {
        // Always made to call parent
        super.init(name: name, breed: "Poodle")
    }
}
 */

// MARK: Overriding methods
class Dog {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
    
}

let poppy = Poodle()
poppy.makeNoise()

// MARK: Final Classes
// Prevents to build class based on yours
// Just add `final` keyword:
// final class Dog {}

// MARK: Copying objects
// Struct: Original and copy are different things
// Class: Copy of the class are the same thing

class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

struct SingerStruct {
    var name = "Taylor Swift"
}

print("---")

var singerStruct = SingerStruct()
print(singerStruct.name)

var singerStructCopy = singerStruct
singerStructCopy.name = "JB"
print(singerStruct.name)

// MARK: Deinitializers
// Code that runs when instance of class is destroyed

class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// MARK: Mutability
// Constant struct with variable property, that property can't be changed because
// that struct itself is constant

class Singer2 {
    var name = "TaylorSwift"
}

let taylor = Singer2()
taylor.name = "Ed Sheeran" // if you want to stop this from happening, need to `let name`
print(taylor.name)

// MARK: Summary
/*
 1. Classes and struct are similar
 2. One class can inherit from another, and gains all properties and methods of parent
 3. Can mark class as `final`, to stop inheritance
 4. Method overriding to replace method in parent with new implementation
 5. When two variables point at the same class instance, they both point at the same piece of
    memory -- changing one changes the other
 6. Classes can have a deinitializer, which is code that gets run when an instnace of the class is destroyed
 7. Classes don't enforce constants as strongly as structs -- if a property is declared as a variable,
    it can be changed regardless of how the class instance was created
 */

