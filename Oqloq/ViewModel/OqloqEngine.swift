//
//  OqloqEngine.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 20.10.2021.
//

import SwiftUI
import Combine

class OqloqEngine: ObservableObject {
        
    @Published private var model: ClockEngine<Color> = ClockEngine()
    
    var timelines: Array<ClockEngine<Color>.Timeline> = []
    
    init() {
        timelines.append(contentsOf: [
            ClockEngine<Color>.Timeline(angle: 0, color: Color.green, startPoint: 0.0, endpoint: 0.3)
        ])
    }
    
    var currentHour: Time {
        model.currentHour
    }
    
    var timePublisher: Publishers.Autoconnect<Timer.TimerPublisher> {
        model.timePublisher
    }
    
    func addTimeline(color: Color) {
        timelines.append(ClockEngine.Timeline(angle: 0, color: color, startPoint: 0.0, endpoint: 0.3))
    }
}
