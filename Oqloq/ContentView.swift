//
//  ContentView.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 6.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var currentTime = Time(hour: 0)
    @State var timePublisher = Timer.publish(every: 3600, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5959428549, blue: 0.5991661549, alpha: 1)), Color(#colorLiteral(red: 0.02366073802, green: 0.4557065964, blue: 0.4581259489, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                Clock(rotation: $currentTime)
            }
        }
        .onAppear {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: Date())
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(Animation.interactiveSpring(response: 1, dampingFraction: 1.5, blendDuration: 0)) {
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

