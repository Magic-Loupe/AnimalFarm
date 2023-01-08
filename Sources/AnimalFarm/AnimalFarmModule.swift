import Foundation
import JXBridge
import JXKit
import JXSwiftUI

public extension JXNamespace {
    static let animalfarm: JXNamespace = "animalfarm"
}

public struct AnimalFarmModule: JXDynamicModule {
    public static let namespace: JXNamespace = .animalfarm
    public static var bundle = Bundle.module

    public func register(with registry: JXRegistry) throws {
        try registry.register(JXSwiftUI())
        try registry.registerBridge(for: AnimalFarmModel(), namespace: Self.namespace)
        try registry.registerBridge(for: Animal.random(), namespace: Self.namespace)
        try registry.registerBridge(for: AnimalView.self, namespace: Self.namespace)
        try registry.registerModuleScript(resource: "/AnimalFarmView.js", root: Self.localModuleRoot, namespace: Self.namespace)
    }
}
