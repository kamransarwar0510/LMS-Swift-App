import Foundation

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("AscendFrontend_AscendFrontend.bundle").path
        let buildPath = "/Users/macbookpro/Downloads/AscendSwiftUIFrontend/.build/x86_64-apple-macosx/debug/AscendFrontend_AscendFrontend.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            // Users can write a function called fatalError themselves, we should be resilient against that.
            Swift.fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}