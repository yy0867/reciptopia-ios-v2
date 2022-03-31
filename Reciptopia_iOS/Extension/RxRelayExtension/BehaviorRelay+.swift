//
//  RxRelay+Append.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import RxRelay

public extension BehaviorRelay {
    
    func append<T>(_ element: T) where Element == [T] {
        self.accept(self.value + [element])
    }
    
    func remove<T>(at index: Int) where Element == [T] {
        var mutableValue = self.value
        mutableValue.remove(at: index)
        self.accept(mutableValue)
    }
}
