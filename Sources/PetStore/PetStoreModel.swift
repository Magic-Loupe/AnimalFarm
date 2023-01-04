import Combine
import JXBridge

class PetStoreModel: ObservableObject, JXBridging {
    @JXPublished var pets: [Pet] = []
    
    func load() {
        pets = [Pet.random(), Pet.random(), Pet.random(), Pet.random()]
    }
    
    @JXFunc var jxaddPet = addPet
    func addPet() {
        pets.append(Pet.random())
    }
    
    @JXFunc var jxsellPet = sellPet
    func sellPet(id: String) {
        pets = pets.filter { $0.id != id }
    }
}
