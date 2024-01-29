//
//  NetworkProvider.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/29.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkProvider {
    public static func request<T: Decodable>(api: BaseAPI, to responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(api).responseDecodable(of: responseType) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                guard let statusCode = response.response?.statusCode else {
                    print("Network ERROR: Unknown Error")
                    return completion(.failure(.unknownError))
                }
                
                if (400..<500).contains(statusCode) {
                    print("Network ERROR (statusCode:\(statusCode)): Client Error!")
                    completion(.failure(.clientError(statusCode: statusCode)))
                }
                
                if (500..<600).contains(statusCode) {
                    print("Network ERROR (statusCode:\(statusCode)): Server Error!")
                    completion(.failure(.serverError(statusCode: statusCode)))
                }
            }
        }
    }
}
