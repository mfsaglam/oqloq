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
            Timeline(startPosition: 0, length: 0.2, color: "4C3B4D"),
            Timeline(startPosition: 0.2, length: 0.3, color: "A53860"),
            Timeline(startPosition: 0.5, length: 0.2, color: "61C9A8")
        ])
    }
    
    func addTimeline(color: String = "FFFFFF") {
        timelines.append(Timeline(startPosition: 0, length: 0.3, color: color))
    }
    
    func editLength(atIndex index: Int, newLength: Float) {
        timelines[index].length = newLength
    }
    
    func editColor(atIndex index: Int, newColor: String) {
        timelines[index].color = newColor
    }
    
    func deleteTimeline(atIndex index: Int) {
        timelines.remove(at: index)
    }
}
