//
//  DayLog.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation

struct DayLog: Codable, Identifiable, Hashable {
    var id = UUID()
    let date: Date
    let status: DayStatus
}
