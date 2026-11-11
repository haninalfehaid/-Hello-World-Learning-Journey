//
//  Int+Days.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation

extension Int {
    var daysText: String {
        self == 1 ? "1 day" : "\(self) days"
    }
}
