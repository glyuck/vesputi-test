//
//  RequestFactory.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Combine
import Foundation

public enum APIError: Error {
    case requestError(Error)
    case decodeError(Error)
    case encodeError(Error)
}

class RequestFactory {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }

    private let baseURL: URL
    private let additionalHeaders: [String: String]

    init(baseURL: URL, additionalHeaders: [String: String] = [:]) {
        self.baseURL = baseURL
        self.additionalHeaders = additionalHeaders
    }

    func get(_ path: String, parameters: [String: String] = [:]) -> AnyPublisher<Data, APIError> {
        let endpointURL = URL(string: path, relativeTo: baseURL)!
        let urlWithParameters: URL
        if !parameters.isEmpty {
            var components = URLComponents(url: endpointURL, resolvingAgainstBaseURL: true)!
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value.description) }
            urlWithParameters = components.url!
        } else {
            urlWithParameters = endpointURL
        }
        let request = createRequest(method: .get, url: urlWithParameters)
        return requestSignal(request: request)
    }

    func sendJSON(_ method: Method, _ path: String, parameters: [String: Any?]? = nil) -> AnyPublisher<Data, APIError> {
        let endpointURL = URL(string: path, relativeTo: baseURL)!
        var request = createRequest(method: method, url: endpointURL)
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                print("Failed to encode params: \(error)")
                return Result.Publisher(APIError.encodeError(error)).eraseToAnyPublisher()
            }
        }
        return requestSignal(request: request)
    }

    private func createRequest(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = additionalHeaders
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        return request
    }

    private func requestSignal(request: URLRequest) -> AnyPublisher<Data, APIError> {
        print("Request: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .mapError { error -> APIError in
                .requestError(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
