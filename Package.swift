import PackageDescription

let package = Package(
    name: "MatrixSDK",
    dependencies: [
        .Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 6),
        .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1),
        .Package(url: "https://github.com/Moya/Moya", majorVersion: 8),
        .Package(url: "https://github.com/Hearst-DD/ObjectMapper.git", majorVersion: 2, minor: 2),
        .Package(url: "https://github.com/gperdomor/MoyaObjectMapper.git", majorVersion: 1)
    ],
    exclude: [
        "Carthage",
        "Configs",
        "Demo",
        "scripts"
    ]
)
