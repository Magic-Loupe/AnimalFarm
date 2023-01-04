import class Foundation.Bundle
import class Foundation.NSDictionary

// This class supports extracting the version information of the runtime.

/// The bundle for the `AnimalFarm` module.
public let AnimalFarmBundle = Foundation.Bundle.module

/// The information plist for the `AnimalFarm` module, which is stored in `Resources/AnimalFarm.plist` (until SPM supports `Info.plist`).
private let AnimalFarmPlist = AnimalFarmBundle.url(forResource: "AnimalFarm", withExtension: "plist")!

/// The info dictionary for the `AnimalFarm` module.
public let AnimalFarmInfo = NSDictionary(contentsOf: AnimalFarmPlist)

/// The bundle identifier of the `AnimalFarm` module as specified by the `CFBundleIdentifier` of the `AnimalFarmInfo`.
public let AnimalFarmBundleIdentifier: String! = AnimalFarmInfo?["CFBundleIdentifier"] as? String

/// The version of the `AnimalFarm` module as specified by the `CFBundleShortVersionString` of the `AnimalFarmInfo`.
public let AnimalFarmVersion: String! = AnimalFarmInfo?["CFBundleShortVersionString"] as? String

/// The version components of the `CFBundleShortVersionString` of the `AnimalFarmInfo`, such as `[0, 0, 1]` for "0.0.1" ` or `[1, 2]` for "1.2"
private let AnimalFarmV = { AnimalFarmVersion.components(separatedBy: .decimalDigits.inverted).compactMap({ Int($0) }).dropFirst($0).first }

/// The major, minor, and patch version components of the `AnimalFarm` module's `CFBundleShortVersionString`
public let (AnimalFarmVersionMajor, AnimalFarmVersionMinor, AnimalFarmVersionPatch) = (AnimalFarmV(0), AnimalFarmV(1), AnimalFarmV(2))

/// A comparable representation of ``AnimalFarmVersion``, which can be used for comparing known versions and sorting via semver semantics.
///
/// The form of the number is `(major*1M)+(minor*1K)+patch`, so version "1.2.3" becomes `001_002_003`.
/// Caveat: any minor or patch version components over `999` will break the comparison expectation.
public let AnimalFarmVersionNumber = ((AnimalFarmVersionMajor ?? 0) * 1_000_000) + ((AnimalFarmVersionMinor ?? 0) * 1_000) + (AnimalFarmVersionPatch ?? 0)
