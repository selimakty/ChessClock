//
//  Times.swift
//  ChessClock
//
//  Created by Selim on 8.09.2023.
//

import Foundation
import UIKit

struct Time{
    var minute:Int
    var plus:Int
}

struct Times{
    var timeArray = [
        
        Time(minute: 1, plus: 0),
        Time(minute: 2, plus: 1),
        Time(minute: 3, plus: 0),
        Time(minute: 3, plus: 2),
        Time(minute: 5, plus: 0),
        Time(minute: 5, plus: 3),
        Time(minute: 10, plus: 0),
        Time(minute: 10, plus: 5),
        Time(minute: 15, plus: 0),
        Time(minute: 15, plus: 10),
        Time(minute: 30, plus: 0),
        Time(minute: 30, plus: 20)
    ]
}
