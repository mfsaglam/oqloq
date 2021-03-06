//
//  OqloqEngine.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 20.10.2021.
//

import SwiftUI
import Combine

class OqloqEngine: ObservableObject {
        
    @Published private var model: Clock = Clock()
    
    var currentHour: Int {
        model.currentHour.hour
    }
    
    var timePublisher: Publishers.Autoconnect<Timer.TimerPublisher> {
        model.timePublisher
    }

}
