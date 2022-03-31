//
//  Log.swift
//  Reciptopia
//
//  Created by 김세영 on 2022/03/30.
//

import Foundation

public class Log {
    
    static func print(_ message: Any, file: String = #file, function: String = #function) {
        Swift.print("# @ \(Date())")
        Swift.print("# Log at \(file)")
        Swift.print("# \(function)")
        Swift.print("# \(message)")
        Swift.print()
    }
}
