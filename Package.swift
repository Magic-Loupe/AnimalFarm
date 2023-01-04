// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "AnimalFarm",
    defaultLocalization: "en",
    platforms: [ .macOS(.v12), .iOS(.v15) ],
    products: [
        .library(name: "AnimalFarm", targets: ["AnimalFarm"]),
    ],
dependencies: [ .package(name: "swift-docc-plugin", url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/jectivex/JXBridge.git", from: "0.1.14"),
        .package(url: "https://github.com/jectivex/JXSwiftUI", from: "0.1.7"),
    ],
    targets: [
        .target(name: "AnimalFarm", dependencies: [
            .product(name: "JXBridge", package: "JXBridge"),
            .product(name: "JXSwiftUI", package: "JXSwiftUI"),
        ], resources: [
            .process("Resources"),
            .copy("jxmodule"),
        ]),
        .testTarget(
            name: "AnimalFarmTests",
            dependencies: ["AnimalFarm"]),
    ]
)
