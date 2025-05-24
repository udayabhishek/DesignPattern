import Combine

func nums(a: Int, b: Int) {
    a*b
}

let pub = Just(nums(a: 10, b: 20))

let subs = Subscribers.Sink<Int, Never> { completion in
    debugPrint(completion)
} receiveValue: { value in
    print("Value: \(value)")
}

let Sss = any Subscriber<Int, Never>.make()
pub.subscribe(Sss)








   
