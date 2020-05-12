// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unsplash-client-swift",
    products: [
        .library(
            name: "UnsplashClient",
            targets: ["UnsplashClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "UnsplashClient",
            dependencies: [.product(name: "AsyncHTTPClient", package: "async-http-client")]),
        .testTarget(
            name: "UnsplashClientTests",
            dependencies: ["UnsplashClient"]),
    ]
)
