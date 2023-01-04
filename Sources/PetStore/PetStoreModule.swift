import Foundation
import JXBridge
import JXKit
import JXSwiftUI

public extension JXNamespace {
    static let petstore: JXNamespace = "petstore"
}

public struct PetStoreModule: JXModule {
    public var namespace: JXNamespace = .petstore

    /// The localURL is where local script and resources are stored
    public static let localURL = URL(string: "jxmodule", relativeTo: Bundle.module.resourceURL)

    /// The remoteURL gives the location of the URL resources relative to an archive that is derived from the relative URL (which will vary depending on the service provider)
    public static let remoteURL = URL(string: "Sources/PetStore/jxmodule", relativeTo: URL(string: "https://github.com/Magic-Loupe/PetStore.git"))

    public func register(with registry: JXRegistry) throws {
        try registry.register(JXSwiftUI())
        try registry.registerBridge(for: PetStoreModel(), namespace: namespace)
        try registry.registerBridge(for: Pet.random(), namespace: namespace)
        try registry.registerBridge(for: PetView.self, namespace: namespace)
        if let localURL = Self.localURL {
            try registry.registerModuleScript(resource: "/PetStoreView.js", root: localURL, namespace: namespace)
        }
    }
}
