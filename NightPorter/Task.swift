//
//  Task.swift
//  NightPorter
//
//  Created by Waihon Yew on 4/4/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import Foundation

enum Frequency: Int {
    case daily = 0
    case weekly = 1
    case monthly = 2
}

class Task: NSObject {
    var frequency: Frequency?
    var title: String?
    var subtitle: String?
    
    init(frequency: Frequency, title: String, subtitle: String) {
        self.frequency = frequency
        self.title = title
        self.subtitle = subtitle
    }
}
