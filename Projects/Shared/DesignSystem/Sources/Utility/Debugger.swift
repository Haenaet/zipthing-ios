//
//  Debugger.swift
//  DesignSystem
//
//  Created by Yujin Kim on 2024-01-26.
//  Copyright © 2024 Zipthing. All rights reserved.
//

import Foundation

#if RELEASE
public func debug(
    _ object: Any,
    filename: StaticString = #file,
    _ function: StaticString = #function,
    _ line: UInt = #line
) {}
#else
@inline(__always)
public func debug(
    _ object: Any,
    filename: StaticString = #file,
    _ function: StaticString = #function,
    _ line: UInt = #line
) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let timestamp = dateFormatter.string(from: Date())
    
    print("========DEBUG START========")
    print("Time: \(timestamp)")
    dump("File: \(filename)")
    dump("Function: \(function)")
    dump("Line: \(line)")
    dump("Object: \(object)")
    print("========DEBUG END========")
}
#endif
