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
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                Clock(rotation: $currentTime)
            }
        }
        .onAppear {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: Date())
            print(hour)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(Animation.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    self.currentTime = Time(hour: hour)
                }
            }
        }
        .onReceive(timePublisher) { time in
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: Date())
            
            withAnimation(Animation.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                self.currentTime = Time(hour: hour)
                print(currentTime.hour)
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

struct Clock: View {
    @Binding var rotation: Time
    @State var show: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.9542662501, green: 0.9504652619, blue: 0.9572203755, alpha: 1)))
                .overlay(
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.3))
                        .padding(4)
                        .shadow(color: .black.opacity(0.8), radius: 20, x: 20, y: 0)
                )
                .overlay(
                    Text("oqloq")
                        .font(.custom("Alata-Regular", size: 19))
                        .opacity(0.2)
                )
                
                .frame(width: 65, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .offset(y: 30)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7753158212, green: 0.772229135, blue: 0.7777156234, alpha: 1)), Color(#colorLiteral(red: 0.9542153478, green: 0.950414598, blue: 0.9571692348, alpha: 1))]), startPoint: .bottom, endPoint: .top))
                .frame(width: 55, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 5,style: .continuous))
                .offset(y: 30)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
            
            ZStack {
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(1)]), center: .center, startRadius: 50, endRadius: 500))
                    .frame(width: 380, height: 380)
                    .blur(radius: 100)
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.730214417, green: 0.7273079753, blue: 0.7324746251, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
                    .frame(width: 340, height: 340)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: 0.3)
                            .stroke(Color.red.opacity(0.8), lineWidth: 3)
                            .frame(width: 380, height: 380)
                            .rotationEffect(Angle(degrees: -90))
                    )
                    .overlay(
                        Circle()
                            .trim(from: 0.3, to: 0.4)
                            .stroke(Color.blue.opacity(0.8), lineWidth: 3)
                            .frame(width: 380, height: 380)
                            .rotationEffect(Angle(degrees: -90))
                    )
                    .overlay(
                        Circle()
                            .trim(from: 0.4, to: 0.9)
                            .stroke(Color.green.opacity(0.8), lineWidth: 3)
                            .frame(width: 380, height: 380)
                            .rotationEffect(Angle(degrees: -90))
                    )
                    .overlay(
                        Circle()
                            .trim(from: 0.9, to: 1)
                            .stroke(Color.white.opacity(0.8), lineWidth: 3)
                            .frame(width: 380, height: 380)
                            .rotationEffect(Angle(degrees: -90))
                    )
                Circle()
                    .trim(from: 0.0, to: 0.002)
                    .stroke(Color.black, lineWidth: 60)
                    .frame(width: 280, height: 280)
                    .rotationEffect(Angle(degrees: -90))
                    // indicator rotation effect
                    .rotationEffect(Angle(degrees: show ? Double(rotation.hour) : 0))
                    .rotationEffect(Angle(degrees: Double(rotation.hour) * 30))
            }
            .onLongPressGesture {
//                Text("Options")
//                    .font(.custom("Alata-Regular", size: 20))
            }
        }
        .frame(height: 500)
        .onAppear {
            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 0.5))  {
                show = true
            }
        }
    }
}
