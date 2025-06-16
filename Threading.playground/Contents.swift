import Foundation
var num = 10

let workItem = DispatchWorkItem {
    //Task
    num += 3
}

let queue = DispatchQueue.global(qos: .utility)

workItem.notify(queue: .main) {
    print("updated num: \(num)")
}



queue.async(execute: workItem)
//queue.sync(execute: workItem)


workItem.cancel() //to cancel the task
workItem.isCancelled //to check task is cancelled or not



