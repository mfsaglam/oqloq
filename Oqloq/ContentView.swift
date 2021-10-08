//
//  ContentView.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 6.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var currentTime = Time(hour: 0)
    @State var timePublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                Clock(rotation: $currentTime)
            }
        }
        .onAppear {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: Date())
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(Animation.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    self.currentTime = Time(hour: hour)
                }
            }
        }
        .onReceive(timePublisher) { time in
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: Date())
            
            withAnimation(.linear(duration: 1)) {
                self.currentTime = Time(hour: hour)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct Time {
    var hour: Int
}


