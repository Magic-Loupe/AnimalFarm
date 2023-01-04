import JXBridge
import JXSwiftUI
import SwiftUI

struct PetView: View {
    @State private var isPriceHidden = true
    
    let pet: Pet
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(pet.animal)
                .bold()
            Group {
                if isPriceHidden {
                    Text("Tap for price")
                        .underline()
                } else {
                    Text("$\(String(format: "%.2f", pet.price))")
                        .underline()
                }
            }
            .foregroundColor(.blue)
            .onTapGesture {
                isPriceHidden.toggle()
            }
        }
    }
}

extension PetView: JXStaticBridging {
    static func jxBridge() throws -> JXBridge {
        JXBridgeBuilder(type: self).asJXSwiftUIView().constructor { PetView.init }.bridge
    }
}
