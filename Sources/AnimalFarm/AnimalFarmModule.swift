import Foundation
import JXBridge
import JXKit
import JXSwiftUI

public extension JXNamespace {
    static let animalfarm: JXNamespace = "animalfarm"
}

public struct AnimalFarmModule: JXDynamicModule {
    public var namespace: JXNamespace = .animalfarm

    /// The localURL is where local script and resources are stored
    public static let localURL = URL(string: "jxmodule", relativeTo: Bundle.module.resourceURL)!

    /// The remoteURL gives the location of the URL resources relative to an archive that is derived from the relative URL (which will vary depending on the service provider)
    public static let remoteURL = URL(string: "Sources/AnimalFarm/jxmodule", relativeTo: URL(string: "https://github.com/Magic-Loupe/AnimalFarm.git"))!

    public func register(with registry: JXRegistry) throws {
        try registry.register(JXSwiftUI())
        try registry.registerBridge(for: AnimalFarmModel(), namespace: namespace)
        try registry.registerBridge(for: Animal.random(), namespace: namespace)
        try registry.registerBridge(for: AnimalView.self, namespace: namespace)
        try registry.registerModuleScript(resource: "/AnimalFarmView.js", root: Self.localURL, namespace: namespace)
    }
}
