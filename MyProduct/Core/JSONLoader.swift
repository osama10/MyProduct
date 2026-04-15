import Foundation

enum JSONLoaderError: LocalizedError {
    case fileNotFound(String)
    case unreadable(String, Error)
    case decodingFailed(String, Error)

    var errorDescription: String? {
        switch self {
        case .fileNotFound(let filename):
            "JSON file '\(filename)' not found in bundle."
        case .unreadable(let filename, let underlyingError):
            "Failed to read '\(filename)': \(underlyingError.localizedDescription)"
        case .decodingFailed(let filename, let underlyingError):
            "Failed to decode '\(filename)': \(underlyingError.localizedDescription)"
        }
    }
}

func loadJSON<T: Decodable>(_ filename: String, from bundle: Bundle = .main) throws -> T {
    guard let url = bundle.url(forResource: filename, withExtension: nil) else {
        throw JSONLoaderError.fileNotFound(filename)
    }

    let data: Data
    do {
        data = try Data(contentsOf: url)
    } catch {
        throw JSONLoaderError.unreadable(filename, error)
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        throw JSONLoaderError.decodingFailed(filename, error)
    }
}
