//
//  BaseViewTests.swift
//  ReciptopiaUIKitTests
//
//  Created by 김세영 on 2022/03/29.
//

import XCTest
@testable import ReciptopiaUIKit

class BaseViewTests: XCTestCase {
    
    private class FakeBaseView: BaseView {
        var buildHierarchyCalledCount = 0
        var activateConstraintsCalledCount = 0
        var addTargetsCalledCount = 0
        
        override func buildHierarchy() {
            buildHierarchyCalledCount += 1
        }
        
        override func activateConstraints() {
            activateConstraintsCalledCount += 1
        }
        
        override func addTargets() {
            addTargetsCalledCount += 1
        }
    }
    
    func test_BaseView_didMoveToWindow_shouldConfigureView() {
        // Given
        let fakeBaseView = FakeBaseView(frame: .zero)
        
        // When
        fakeBaseView.didMoveToWindow()
        
        // Then
        XCTAssertEqual(fakeBaseView.buildHierarchyCalledCount, 1)
        XCTAssertEqual(fakeBaseView.activateConstraintsCalledCount, 1)
        XCTAssertEqual(fakeBaseView.addTargetsCalledCount, 1)
    }
    
    func test_BaseView_retryDidMoveToWindow_shouldNotConfigureView() {
        // Given
        let fakeBaseView = FakeBaseView(frame: .zero)
        
        // When
        for _ in 1...Int.random(in: 2...10) {
            fakeBaseView.didMoveToWindow()
        }
        
        // Then
        XCTAssertEqual(fakeBaseView.buildHierarchyCalledCount, 1)
        XCTAssertEqual(fakeBaseView.activateConstraintsCalledCount, 1)
        XCTAssertEqual(fakeBaseView.addTargetsCalledCount, 1)
    }
}
