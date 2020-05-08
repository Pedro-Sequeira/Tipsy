import Foundation

struct Bill {
    let value: Double
    let tip: Double
    let numberOfPeople: Int
    
    init(_ value: Double, _ tip: Double, _ numberOfPeople: Int) {
        self.value = value
        self.tip = tip
        self.numberOfPeople = numberOfPeople
    }
}
