//
//  Task.swift
//  The Night Porter
//
//  Created by Vinícius Furukawa Carvalho on 29/04/20.
//  Copyright © 2020 Vinícius Furukawa Carvalho. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
