import class Foundation.Bundle
import class Foundation.NSDictionary

// This class supports extracting the version information of the runtime.

/// The bundle for the `PetStore` module.
public let PetStoreBundle = Foundation.Bundle.module

/// The information plist for the `PetStore` module, which is stored in `Resources/PetStore.plist` (until SPM supports `Info.plist`).
private let PetStorePlist = PetStoreBundle.url(forResource: "PetStore", withExtension: "plist")!

/// The info dictionary for the `PetStore` module.
public let PetStoreInfo = NSDictionary(contentsOf: PetStorePlist)

/// The bundle identifier of the `PetStore` module as specified by the `CFBundleIdentifier` of the `PetStoreInfo`.
public let PetStoreBundleIdentifier: String! = PetStoreInfo?["CFBundleIdentifier"] as? String

/// The version of the `PetStore` module as specified by the `CFBundleShortVersionString` of the `PetStoreInfo`.
public let PetStoreVersion: String! = PetStoreInfo?["CFBundleShortVersionString"] as? String

/// The version components of the `CFBundleShortVersionString` of the `PetStoreInfo`, such as `[0, 0, 1]` for "0.0.1" ` or `[1, 2]` for "1.2"
private let PetStoreV = { PetStoreVersion.components(separatedBy: .decimalDigits.inverted).compactMap({ Int($0) }).dropFirst($0).first }

/// The major, minor, and patch version components of the `PetStore` module's `CFBundleShortVersionString`
public let (PetStoreVersionMajor, PetStoreVersionMinor, PetStoreVersionPatch) = (PetStoreV(0), PetStoreV(1), PetStoreV(2))

/// A comparable representation of ``PetStoreVersion``, which can be used for comparing known versions and sorting via semver semantics.
///
/// The form of the number is `(major*1M)+(minor*1K)+patch`, so version "1.2.3" becomes `001_002_003`.
/// Caveat: any minor or patch version components over `999` will break the comparison expectation.
public let PetStoreVersionNumber = ((PetStoreVersionMajor ?? 0) * 1_000_000) + ((PetStoreVersionMinor ?? 0) * 1_000) + (PetStoreVersionPatch ?? 0)
