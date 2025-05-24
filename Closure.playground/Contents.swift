import UIKit

func makeCounter() {
    var count = 10
    let closure = { [count] in
//        count += 1
        print("Captured value \(count)")
    }
    count = 20
    closure()
}
 
makeCounter()


func makeInc(withValue amt: Int) -> () -> Int {
    var total = 0
    
    func incrementer() -> Int {
        total += amt
        return total
    }
    return incrementer
}

let inc10 = makeInc(withValue: 10)
inc10()
inc10()

let inc15 = makeInc(withValue: 15)
inc15()
inc15()
inc15()
inc15()
inc10()

let anotherInc10 = inc10
anotherInc10()

var complHandlers: [() -> Void] = []

@MainActor func escapingClosure(completionHandler: @escaping () -> Void) {
    complHandlers.append(completionHandler)
}

func nonEscapingClosure(closure: () -> Void) {
    closure ()
}


class TestClass {
    var x = 10
    @MainActor func doSomething() {
 
        nonEscapingClosure {
            x = 2000
        }
        escapingClosure {
            [self] in x = 1000
        }
    }
}

let instance = TestClass()
instance.doSomething()
print(instance.x)

complHandlers.first?()
print(instance.x)


