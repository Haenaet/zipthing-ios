//
//  NetworkRequestable.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/28.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation
import Alamofire

/// `NetworkRequestable`프로토콜은 `Alamofire`에서 제공하는 `URLRequestConvertible`프로토콜을 준수하는 프로토콜이며,
/// API 구현 시 해당 프로토콜을 채택해야합니다.

public protocol NetworkRequestable: URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension NetworkRequestable {
    public var baseURL: URL {
        // Note: - 임시 URL 넣었습니다.
        guard let url = URL(string: "zipthing.com") else { fatalError() }
        return url
    }
    
    public var headers: HTTPHeaders {
        return [
            "accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
    
    public var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.method = method
        urlRequest.headers = headers
        
        if let parameters = parameters {
            return try encoding.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
