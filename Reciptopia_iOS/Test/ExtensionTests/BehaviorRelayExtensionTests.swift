//
//  BehaviorRelayExtensionTests.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import XCTest
import RxRelay
import RxSwift
@testable import Reciptopia_iOS

class BehaviorRelayExtensionTests: XCTestCase {
    
    func test_BehaviorRelayExtension_append_shouldAppendAndAccept() {
        // Given
        let relay = BehaviorRelay<[String]>(value: [])
        let disposeBag = DisposeBag()
        let appendCount = Int.random(in: 10...12)
        
        // When
        relay.subscribe(onNext: { randomString in
            print("received: \(randomString)")
        }).disposed(by: disposeBag)
        
        for _ in 0..<appendCount {
            let randomString = randomString(randomLength: 3..<20)
            relay.append(randomString)
            print("append: \(randomString)")
        }
        
        // Then
        print(relay.value)
    }
    
    func test_BehaviorRelayExtesion_removeAt_shouldRemoveAndAccept() {
        // Given
        let randomCount = Int.random(in: 1...100)
        var source = [String]()
        for i in 1...randomCount { source.append(String(i)) }
        let relay = BehaviorRelay<[String]>(value: source)
        let disposeBag = DisposeBag()
        var receivedSource = [String]()
        
        // When
        relay.subscribe(onNext: { string in
            receivedSource = string
        }).disposed(by: disposeBag)
        
        let randomIndex = Int.random(in: 0..<randomCount)
        relay.remove(at: randomIndex)
        
        // Then
        let removedValue = source[randomIndex]
        XCTAssertFalse(receivedSource.contains(removedValue))
    }
}
