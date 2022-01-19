//
//  Timeline.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 18.01.2022.
//

import Foundation

struct Timeline: Identifiable {
    var id = UUID()
    var startPosition: Float = 0 // Beginning position of the timeline, from 0 to 1
    var length: Float = 0.3 // default length
    var color: String
    
    var endPosition: Float {
        startPosition + length
    }
    
    init(startPosition: Float, length: Float, color: String) {
        self.startPosition = startPosition
        self.length = length
        self.color = color
    }
}
