//
//  ContentView.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 6.10.2021.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        ZStack {
            wall
                .ignoresSafeArea()
            ClockView()
        }
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
