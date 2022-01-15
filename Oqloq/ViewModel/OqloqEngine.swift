//
//  OqloqEngine.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 20.10.2021.
//

import SwiftUI
import Combine

class OqloqEngine: ObservableObject {
        
    @Published private var model: ClockEngine = ClockEngine()
    
    var timelines: Array<ClockEngine.Timeline> = []
    
    init() {
        timelines.append(contentsOf: [
            ClockEngine.Timeline(angle: 0, color: "4CD964", startPoint: 0.0, endpoint: 0.3)
        ])
    }
    
    var currentHour: Time {
        model.currentHour
    }
    
    var timePublisher: Publishers.Autoconnect<Timer.TimerPublisher> {
        model.timePublisher
    }
    
    func addTimeline(color: String) {
        timelines.append(ClockEngine.Timeline(angle: 0, color: color, startPoint: 0.0, endpoint: 0.3))
    }
}
