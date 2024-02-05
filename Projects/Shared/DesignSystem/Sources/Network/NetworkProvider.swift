//
//  NetworkProvider.swift
//  DesignSystem
//
//  Created by playhong on 2024/01/29.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation
import Alamofire

/// `NetworkProvider`는 네트워크 요청을 제공하는 열거형입니다.

public enum NetworkProvider {
    /// 네트워크 요청을 위한 메서드
    /// - Parameters:
    ///   - api: 네트워크 요청을 위한 API입니다.
    ///   - to: 응답 결과로 전달받는 JSON 데이터를 디코딩 할 타입입니다.
    ///   - completion: 응답 결과에 대한 완료 핸들러입니다.
    public static func request<T: Decodable>(api: NetworkRequestable, to responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
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
