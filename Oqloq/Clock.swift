//
//  Clock.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 8.10.2021.
//

import SwiftUI

struct Clock: View {
    var timelines: [Timeline] = [
        Timeline(startPoint: 0, endpoint: 0.3, color: .red),
        Timeline(startPoint: 0.3, endpoint: 0.9, color: .blue),
        Timeline(startPoint: 0.9, endpoint: 1, color: .red)
    ]
    @Binding var rotation: Time
    @State var show: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.9542662501, green: 0.9504652619, blue: 0.9572203755, alpha: 1)))
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.3))
                            .padding(4)
                            .shadow(color: .black.opacity(0.8), radius: 20, x: 20, y: 0)
                        Text("oqloq")
                            .font(.custom("Alata-Regular", size: 19))
                            .opacity(0.2)
                    }
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
                ColoredCircle(timelines: timelines)
                Circle()
                    .trim(from: 0.0, to: 0.002)
                    .stroke(Color.black, lineWidth: 60)
                    .frame(width: 280, height: 280)
                    .rotationEffect(Angle(degrees: -90))
                    // indicator rotation effect
//                    .rotationEffect(Angle(degrees: show ? Double(rotation.hour) : 0))
                    .rotationEffect(Angle(degrees: Double(rotation.hour) * 15))
            }
            .onLongPressGesture {
//                Text("Options")
//                    .font(.custom("Alata-Regular", size: 20))
            }
        }
        .frame(height: 500)
        .onAppear {
            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1))  {
                show = true
            }
        }
    }
}


struct ColoredCircle: View {
    var timelines: [Timeline]
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.730214417, green: 0.7273079753, blue: 0.7324746251, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
                .frame(width: 340, height: 340)
            ForEach(timelines.indices) { item in
                timelines[item]
            }
        }
            
    }
}

struct Timeline: View {
    var startPoint: CGFloat
    var endpoint: CGFloat
    var color: Color
    var body: some View {
        Circle()
            .trim(from: CGFloat(startPoint), to: endpoint)
            .stroke(color.opacity(0.8), lineWidth: 3)
            .frame(width: 380, height: 380)
            .rotationEffect(Angle(degrees: -90))
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        Clock(rotation: .constant(Time(hour: 240)))
    }
}
