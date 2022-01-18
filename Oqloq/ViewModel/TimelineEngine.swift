//
//  TimelineEngine.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 18.01.2022.
//

import SwiftUI

class TimelineEngine: ObservableObject {
    
    @Published var timelines: [Timeline] = []
    
    init() {
        loadTimelines()
    }
    
    func loadTimelines() {
        timelines.append(contentsOf: [
            Timeline(color: "ffffff")
        ])
    }
    
    func addTimeline(color: String = "FFFFFF") {
        timelines.append(Timeline(color: color))
    }
}
