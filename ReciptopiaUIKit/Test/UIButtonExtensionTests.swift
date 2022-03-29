//
//  UIButtonExtensionTests.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/03/30.
//

import XCTest
@testable import ReciptopiaUIKit

class UIButtonExtensionTests: XCTestCase {
    
    let colorSource: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .accentColor]
    
    func test_UIButtonExtesion_BackgroundAndTitle_shouldContainsAllValues() {
        // Given
        let backgroundColor = colorSource.randomElement()!
        let titleColor = colorSource.randomElement()!
        let title = randomString(randomLength: 3..<50)
        let font = UIFont.systemFont(ofSize: 12)
        
        // When
        let testButton = UIButton(
            backgroundColor: backgroundColor,
            titleColor: titleColor,
            title: title,
            font: font
        )
        
        // Then
        XCTAssertEqual(testButton.backgroundColor, backgroundColor)
        XCTAssertEqual(testButton.titleColor(for: .normal), titleColor)
        XCTAssertEqual(testButton.title(for: .normal), title)
        XCTAssertEqual(testButton.titleLabel?.font, font)
    }
    
    func test_UIButtonExtension_giveTitleOnly_shouldContainsAllValues() {
        // Given
        let title = randomString(randomLength: 3..<50)
        
        // When
        let testButton = UIButton(title: title)
        
        // Then
        XCTAssertEqual(testButton.backgroundColor, .accentColor)
        XCTAssertEqual(testButton.titleColor(for: .normal), .white)
        XCTAssertEqual(testButton.title(for: .normal), title)
        XCTAssertEqual(testButton.titleLabel?.font, .systemFont(ofSize: 16))
    }
}
