//
//  NetworkError.swift
//  DesignSystem
//
//  Created by 박성원 on 1/19/24.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation


public enum NetworkError: Error, CustomStringConvertible {
    case inValidURLString //URL 문자열이 유효하지 않음
    case notFound //요청한 정보(리소스)를 찾을 수 없음
    case validationError(statusCode: Int) //유효성 검사 에러
    case serverError(statusCode: Int) //서버에서 내부적으로 에러가 발생함
    case unknownError //알 수 없는 에러
    
    public var description: String {
        switch self {
        case .inValidURLString:             return "inValidURLString"
        case .notFound:                     return "Not Found"
        case .validationError:              return "Validation Errors"
        case .serverError:                  return "Internal Server Error"
        case .unknownError:                 return "Something went wrong."
        }
    }
    
    public var code: Int {
        switch self {
        case .inValidURLString:                             return 2001
        case .notFound:                                     return 2002
        case .validationError(statusCode: let statusCode):  return statusCode
        case .serverError(statusCode: let statusCode):      return statusCode
        case .unknownError:                                 return 2003
        }
    }
}

