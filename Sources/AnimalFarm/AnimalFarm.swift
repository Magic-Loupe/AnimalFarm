import Foundation
import JXBridge

class Animal: JXBridging {
    @JX var id: String
    @JX var animal: String
    @JX var price: Double
    @JX var name: String?
    @JX var birthdate: Date?
    
    init(id: String, animal: String, price: Double) {
        self.id = id
        self.animal = animal
        self.price = price
    }
    
    static func random() -> Animal {
        let id = UUID().uuidString
        let animal = animals.randomElement()!
        let price = Double(Int.random(in: 10...100)) - 0.01
        return Animal(id: id, animal: animal, price: price)
    }
    
    private static let animals = [
        "Cow", "Llama", "Kangaroo", "Dinosaur"
    ]
}
