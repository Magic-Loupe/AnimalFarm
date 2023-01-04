import Foundation
import JXBridge

class Pet: JXBridging {
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
    
    static func random() -> Pet {
        let id = UUID().uuidString
        let animal = animals.randomElement()!
        let price = Double(Int.random(in: 10...100)) - 0.01
        return Pet(id: id, animal: animal, price: price)
    }
    
    private static let animals = [
        "Cat", "Dog", "Ferret", "Fish", "Guinea Pig", "Hampster", "Hedgehog", "Hermit Crab", "Lizard", "Mouse", "Parrot", "Rabbit", "Rat", "Scorpion", "Snake", "Tarantula"
    ]
}
