import UIKit

//MARK: - Single Responsibility Principle

/// this is non-compliant to SRP
/*
class SomeAPIClass {
  func updateLocalData() {
    let data = requestDataFromAPI()
    let array = parse(data: data)
    saveToDB(array: array)
  }

  private func requestDataFromAPI() -> Data {
   // send API request and wait the response
  }

  private func parse(data: Data) -> [String] {
   // parse the data and create the array
  }

  private func saveToDB(array: [String]) {
   // save the array in a database (CoreData/Realm/...)
  }
}
*/


///After implementing SRP
///
class SomeAPIClass {
    private let dataManager = DataManager()
    private let parser = Parser()
    private let dbManager = DBManager()
    
    func updateLocalData() {
        let data = dataManager.requestDataFromAPI()
        let array = parser.parse(data: data)
        dbManager.saveToDB(array: array)
    }
}

class DataManager {
    func requestDataFromAPI() -> Data {
        return Data()
    }
}

class Parser {
    func parse(data: Data) -> [String] {
        return []
    }
}

class DBManager {
    func saveToDB(array: [String]) {
        
    }
}


//MARK: - Open/Closed Principle
/*
 The open-closed principle states that a class should be open for extension, but closed for modification. This means that a class should be designed in such a way that new functionality can be added without modifying the existing code.
*/

protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    private var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
}

class Square: Shape {
    private var side: Double
    
    init(side: Double) {
        self.side = side
    }
    
    func area() -> Double {
        return side * side
    }
}

class Triangle: Shape {
    private var base: Double
    private var height: Double
    
    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }
    
    func area() -> Double {
        return 0.5 * base * height
    }
}

class CalculateArea {
    func calculateArea(shape: Shape) -> Double {
        return shape.area()
    }
}

let claculator = CalculateArea()
let circleArea = claculator.calculateArea(shape: Circle(radius: 5))
print("Circle area: \(circleArea)")

let squareArea = claculator.calculateArea(shape: Square(side: 5))
print( "Square area: \(squareArea)")

let triangleArea = claculator.calculateArea(shape: Triangle(base: 5, height: 3))
print("Triangle area: \(triangleArea)")


    

//MARK: - Liskov Substitution
/*
- Subclass/derived class should be substitutable for their base/parent class.
 
- The Liskov substitution principle states that objects of a superclass should be able to be replaced with objects of a subclass without affecting the correctness of the program
*/

class Car {
    func startEngine() -> String {
        return "Starting the engine"
    }
}

class ElectricCar: Car {
    override func startEngine() -> String {
        return "Electric car is already started"
    }
}

let car: Car = Car()
car.startEngine()

let eEar: Car = ElectricCar()
eEar.startEngine()

//MARK: - Interface Segregation Principle
/*
 - A class should not be forced to implement interfaces it doesn’t use, a class should only be required to implement the methods it needs.
*/


/// this is non-compliant to ISP
/*
protocol Printable {
  func printDocument()
  func scanDocument()
  func faxDocument()
}

class Printer: Printable {
  func printDocument() {
    // Code to print document
  }

  func scanDocument() {
    // Not implemented
  }

  func faxDocument() {
    // Not implemented
  }
}
 */

///After implementing ISP

protocol Printable {
  func printDocument()
}

protocol Scanable {
  func scanDocument()
}

class Printer: Printable {
  func printDocument() {
    // Code to print document
  }
}

class Scanner: Scanable {
  func scanDocument() {
    // Code to scan document
  }
}
