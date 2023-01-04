import JXBridge
import JXSwiftUI
import SwiftUI

struct AnimalView: View {
    @State private var isPriceHidden = true
    
    let pet: Animal
    
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

extension AnimalView: JXStaticBridging {
    static func jxBridge() throws -> JXBridge {
        JXBridgeBuilder(type: self).asJXSwiftUIView().constructor { AnimalView.init }.bridge
    }
}
