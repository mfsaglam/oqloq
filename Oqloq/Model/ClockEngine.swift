//
//  ClockEngine.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 20.10.2021.
//

import Foundation
import Combine

struct ClockEngine<TimelineColor> {
    
    private(set) var currentHour: Time
    private(set) var timePublisher: Publishers.Autoconnect<Timer.TimerPublisher>
    
    init() {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        currentHour = Time(hour: hour)
        timePublisher = Timer.publish(every: 3600, on: .main, in: .common).autoconnect()
    }
    
    struct Timeline {
        var rotation: Float = 0
        var angle: Float
        var color: TimelineColor
        var startPoint: Float
        var endpoint: Float
    }
}

struct Time {
    var hour: Int
}
