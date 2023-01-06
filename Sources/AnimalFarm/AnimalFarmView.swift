import JXKit
import JXSwiftUI
import SwiftUI

public struct AnimalFarmView: View {
    let context: JXContext
    @Environment(\.dismiss) private var dismiss
    @StateObject private var model: AnimalFarmModel = {
        let model = AnimalFarmModel()
        model.load()
        return model
    }()
    
    public init(context: JXContext = JXContext()) {
        self.context = context
        do {
            try context.registry.register(AnimalFarmModule())
        } catch {
            print("AnimalFarmView: \(error)")
        }
    }
    
    public var body: some View {
        NavigationView {
            JXView(context: context) { context in
                return try context.new("animalfarm.AnimalListView", withArguments: [model])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
    }
}
