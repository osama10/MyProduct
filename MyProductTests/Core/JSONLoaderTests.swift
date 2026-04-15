import Foundation
import Testing
@testable import MyProduct

private struct TestItem: Decodable, Equatable {
    let name: String
}

@Suite("JSONLoader Tests")
struct JSONLoaderTests {

    @Test("Loads and decodes valid JSON successfully")
    func loadValidJSON() throws {
        let testBundle = Bundle(for: BundleToken.self)
        let result: TestItem = try loadJSON("valid_test.json", from: testBundle)
        #expect(result == TestItem(name: "Test Item"))
    }

    @Test("Throws fileNotFound for missing file")
    func throwsFileNotFound() {
        #expect(throws: JSONLoaderError.self) {
            let _: TestItem = try loadJSON("nonexistent.json")
        }
    }

    @Test("Throws decodingFailed for invalid JSON structure")
    func throwsDecodingFailed() {
        let testBundle = Bundle(for: BundleToken.self)
        #expect(throws: JSONLoaderError.self) {
            let _: TestItem = try loadJSON("invalid_test.json", from: testBundle)
        }
    }
}

// Used to locate the test bundle
private final class BundleToken {}
