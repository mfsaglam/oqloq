//
//  OqloqApp.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 6.10.2021.
//

import SwiftUI

@main
struct OqloqApp: App {
    var body: some Scene {
        WindowGroup {
            Clock(
                timelines : [
                    Timeline(startPoint: 0, color: .red, endpoint: 0.3, lineWidth: 3),
                    Timeline(startPoint: 0.3, color: .blue, endpoint: 0.9, lineWidth: 3),
                    Timeline(startPoint: 0.9, color: .red, endpoint: 1, lineWidth: 3)
                ],
                rotation: .constant(Time(hour: 240)),
                showOptions: true)
        }
    }
}
