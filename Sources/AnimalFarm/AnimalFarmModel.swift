import Combine
import JXBridge

class AnimalFarmModel: ObservableObject, JXBridging {
    @JXPublished var pets: [Animal] = []
    
    func load() {
        pets = [Animal.random(), Animal.random(), Animal.random(), Animal.random()]
    }
    
    @JXFunc var jxaddPet = addPet
    func addPet() {
        pets.append(Animal.random())
    }
    
    @JXFunc var jxsellPet = sellPet
    func sellPet(id: String) {
        pets = pets.filter { $0.id != id }
    }
}
