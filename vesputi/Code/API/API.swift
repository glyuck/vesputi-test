//
//  API.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Combine
import Foundation

class API {
    private let requestFactory: RequestFactory

    init(baseURL: URL) {
        self.requestFactory = RequestFactory(baseURL: baseURL)
    }

    func getFeatures() -> AnyPublisher<[MapPOI], APIError> {
        requestFactory
            .get("features.json", parameters: ["app_mode": "swh-mein-halle-mobil"])
            .decode(type: [MapPOI].self, decoder: JSONDecoder())
            .mapError {
                APIError.decodeError($0)
            }
            .eraseToAnyPublisher()
    }
}
