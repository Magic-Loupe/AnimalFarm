// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "AnimalFarm",
    defaultLocalization: "en",
    platforms: [ .macOS(.v12), .iOS(.v15) ],
    products: [
        .library(name: "AnimalFarm", targets: ["AnimalFarm"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jectivex/JXBridge.git", from: "0.1.14"),
        .package(url: "https://github.com/jectivex/JXSwiftUI", from: "0.1.7"),
    ],
    targets: [
        .target(name: "AnimalFarm", dependencies: [
            .product(name: "JXBridge", package: "JXBridge"),
            .product(name: "JXSwiftUI", package: "JXSwiftUI"),
        ], resources: [
            .process("Resources"),
            .copy("jx"),
        ]),
        .testTarget(
            name: "AnimalFarmTests",
            dependencies: ["AnimalFarm"]),
    ]
)
