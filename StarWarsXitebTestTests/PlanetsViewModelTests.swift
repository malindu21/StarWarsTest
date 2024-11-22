//
//  PlanetsViewModelTests.swift
//  StarWarsXitebTestTests
//
//  Created by Malinduk on 2024-11-22.
//

import Combine
@testable import StarWarsXitebTest
import XCTest

class PlanetsViewModelTests: XCTestCase {
    var viewModel: PlanetsViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = PlanetsViewModel()
        cancellables = []
        MockURLProtocol.requestHandler = nil
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchPlanetsSuccess() {
        // Mock successful response
        let mockPlanets = [
            Planet(name: "Tatooine", climate: "arid", orbitalPeriod: "365", gravity: "1"),
            Planet(name: "Alderaan", climate: "temperate", orbitalPeriod: "364", gravity: "1")
        ]
        let mockResponse = PlanetsResponse(results: mockPlanets)
        let mockData = try! JSONEncoder().encode(mockResponse)

        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let expectation = XCTestExpectation(description: "Fetch planets successfully")

        viewModel.fetchPlanets()
    }
}

// MARK: - MockURLProtocol

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler is unavailable.")
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}
