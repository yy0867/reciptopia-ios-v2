//
//  XCTestCase+.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import XCTest

extension XCTestCase {
    
    /// Generates a random `String` equal to given length.
    ///
    /// - Parameter length: Length of the string to be generated. default value is 10.
    /// - Returns: Random string with given `length`
    func randomString(length: Int = 10) -> String {
        var source = "abcdefghijklmnopqrstuvwxyz"
        source.append(source.uppercased())
        
        var result = ""
        for _ in 0..<length { result.append(source.randomElement()!) }
        return result
    }
    
    /// Generates a random `String` with random lengths in a given range.
    ///
    /// - Parameters:
    ///   - range: Length of the random string will be selected between `range`.
    /// - Returns:
    ///     Random string with random lengths in given range.
    func randomString(randomLength range: Range<Int>) -> String {
        let length = Int.random(in: range)
        return randomString(length: length)
    }
}
