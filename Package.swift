// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "repro",
  platforms: [
    .macOS(.v13),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.93.0"),
    .package(url: "https://github.com/pointfreeco/vapor-routing.git", from: "0.1.3"),
  ],
  targets: [
    .executableTarget(
      name: "App",
      dependencies: [
        .product(name: "Vapor", package: "vapor"),
        .product(name: "VaporRouting", package: "vapor-routing"),
      ],
      swiftSettings: [
        .unsafeFlags([
          "-Xfrontend", "-warn-concurrency",
          "-Xfrontend", "-enable-actor-data-race-checks",
        ]),
        .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
      ]
    ),
  ]
)
