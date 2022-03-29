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
}
