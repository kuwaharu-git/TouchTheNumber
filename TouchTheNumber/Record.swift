//
//  Record.swift
//  TouchTheNumber
//
//  Created by 桑島陽斗 on 2025/08/30.
//

import Foundation
import SwiftData

@Model
class Record {
    var id: UUID
    var datetime: Date
    var record_time: Int

    init(datetime: Date, record_time: Int) {
        self.id = UUID()
        self.datetime = datetime
        self.record_time = record_time
    }
}
