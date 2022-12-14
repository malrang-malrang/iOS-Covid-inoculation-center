//
//  MockDataTestManager.swift
//  Covid inoculation centerTests
//
//  Created by 김동욱 on 2022/11/02.
//

import UIKit

struct MockDataTestManager {
    func makeMockUrlSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]

        return URLSession(configuration: configuration)
    }

    func makeRequestSuccessResult() {
        MockURLProtocol.requestHandler = { _ in
            let url = URL(string: "test")!
            let httpResponse = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: "2",
                headerFields: nil
            )!
            let data = NSDataAsset(name: "CenterInformationListSampleData")!.data

            return (httpResponse, data)
        }
    }

    func makeRequestFailureResult() {
        MockURLProtocol.requestHandler = { _ in
            let url = URL(string: "test")!
            let httpResponse = HTTPURLResponse(
                url: url,
                statusCode: 400,
                httpVersion: "2",
                headerFields: nil
            )!
            let data = Data()

            return (httpResponse, data)
        }
    }
}
