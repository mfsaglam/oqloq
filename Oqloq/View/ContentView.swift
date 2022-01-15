//
//  ContentView.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 6.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var engine: OqloqEngine = OqloqEngine()
    
    var body: some View {
        ZStack {
            wall
                .ignoresSafeArea()
//            Clock(rotation: engine.currentHour)
            Clock()
        }
        .onAppear {
//            let calendar = Calendar.current
//            let hour = calendar.component(.hour, from: Date())
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(Animation.interactiveSpring(response: 1, dampingFraction: 1.5, blendDuration: 0)) {
//                    self.currentTime = Time(hour: hour)
                }
            }
        }
        .onReceive(engine.timePublisher) { _ in
            withAnimation(.linear(duration: 1)) {
                
            }
        }
        .environmentObject(engine)
    }
    
    let wall: some View = ZStack {
        Color(#colorLiteral(red: 0.34179247, green: 0.7163152221, blue: 0.6934904516, alpha: 1))
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))]), startPoint: .leading, endPoint: .trailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
