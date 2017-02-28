/**
 *  MediaAPI.swift
 *  MatrixSDK
 *
 *  Created by Gustavo Perdomo on 2/28/17.
 *  Copyright (c) 2017 Gustavo Perdomo. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation
import Moya

public enum MediaMethod: String, RawRepresentable {
    case scale
    case crop
}

public enum MediaAPI {
    case download(media: String, from: String)
    case thumbnail(media: String, from: String, width: Int?, height: Int?, method: MediaMethod?)
    case upload(data: Data)
}

extension MediaAPI: SubTarget {
    public var path: String {
        switch self {
        case .download(let media, let server):
            return "/_matrix/media/r0/download/\(server)/\(media)"
        case .thumbnail(let media, let server, _, _, _):
            return "/_matrix/media/r0/thumbnail/\(server)/\(media)"
        case .upload:
            return "/_matrix/media/r0/upload"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .download, .thumbnail:
            return .get
        case .upload:
            return .post
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        case .download:
            return nil
        case .thumbnail(_, _, let width, let height, let method):
            return [
                "width": width,
                "height": height,
                "method": method ?? MediaMethod.scale,
            ]
        case .upload:
            return nil
        }

    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .download, .thumbnail:
            return .download(DownloadType.request(DefaultDownloadDestination))
        case let .upload(data):
            return .upload(.multipart([MultipartFormData(provider: .data(data), name: "file")]))
        }
    }

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    public var validate: Bool {
        return false
    }
}

private let DefaultDownloadDestination: DownloadDestination = { temporaryURL, response in
    let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    if !directoryURLs.isEmpty {
        return (directoryURLs[0].appendingPathComponent(response.suggestedFilename!), [])
    }

    return (temporaryURL, [])
}
