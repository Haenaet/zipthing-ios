//
//  NetworkError.swift
//  DesignSystem
//
//  Created by 박성원 on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation


///inValidURLError - URL 문자열이 유효하지 않음
///case notFoundError - 요청한 정보(리소스)를 찾을 수 없음
///case validationError(statusCode: Int) - 유효성 검사 에러
///case clientError(statusCode: Int) - 클라이언트에서 에러가 발생함
///case serverError(statusCode: Int) - 서버에서 내부적으로 에러가 발생함
///case unknownError - 알 수 없는 에러


public enum NetworkError: Error, CustomStringConvertible {
    case inValidURLError
    case notFoundError
    case validationError(statusCode: Int)
    case clientError(statusCode: Int)
    case serverError(statusCode: Int)
    case unknownError
    
    public var description: String {
        switch self {
        case .inValidURLError:             
            return "inValidURLString"
        case .notFoundError:                     
            return "Not Found"
        case .validationError:             
            return "Validation Errors"
        case .clientError:
            return "Client Error"
        case .serverError:                  
            return "Server Error"
        case .unknownError:                 
            return "Something went wrong."
        }
    }
    
    public var code: Int {
        switch self {
        case .inValidURLError:
            return 400
        case .notFoundError:
            return 404
        case .validationError(statusCode: let statusCode):
            return statusCode
        case .clientError(statusCode: let statusCode):
            return statusCode
        case .serverError(statusCode: let statusCode):      
            return statusCode
        case .unknownError:                                 
            return 444
        }
    }
}
