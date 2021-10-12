//
//  Clock.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 8.10.2021.
//

import SwiftUI

struct Clock: View {
    var timelines: [Timeline] = [
        Timeline(startPoint: 0, endpoint: 0.3, color: .red, lineWidth: 3),
        Timeline(startPoint: 0.3, endpoint: 0.9, color: .blue, lineWidth: 3),
        Timeline(startPoint: 0.9, endpoint: 1, color: .red, lineWidth: 3)
    ]
    @Binding var rotation: Time
    @State var show: Bool = false
    @State var showOptions = false
    
    var body: some View {
        let mainColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]), startPoint: .bottom, endPoint: .top)
        let indicatorColor = Color.gray
        return VStack(spacing: 0) {
            //hang
            Rectangle()
                .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.3))
                            .padding(4)
                            .shadow(color: .black.opacity(0.8), radius: 20, x: 20, y: 0)
                        Text("oqloq")
                            .foregroundColor(.white)
                            .font(.custom("Alata-Regular", size: 19))
                            .opacity(0.2)
                    }
                )
                
                .frame(width: 65, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .offset(y: 30)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
            //Hanger
            Rectangle()
                .fill(mainColor)
                .frame(width: 55, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 5,style: .continuous))
                .offset(y: 30)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
            
            ZStack {
                //back
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(1)]), center: .center, startRadius: 50, endRadius: 500))
                    .frame(width: 380, height: 380)
//                    .blur(radius: 100)
                    .blendMode(.color)
                ColoredCircle(timelines: timelines)
                //indicator
                Circle()
                    .trim(from: 0.0, to: 0.002)
                    .stroke(indicatorColor, lineWidth: 60)
                    .frame(width: 280, height: 280)
                    .rotationEffect(Angle(degrees: -90))
                    // indicator rotation effect
                    .rotationEffect(Angle(degrees: Double(rotation.hour) * 15))
            }
            .onLongPressGesture {
                withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)) {
                    showOptions = true
                }
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
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
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
    var lineWidth: CGFloat
    var body: some View {
        Circle()
            .trim(from: CGFloat(startPoint), to: endpoint)
            .stroke(color.opacity(0.8), lineWidth: lineWidth)
            .frame(width: 380, height: 380)
            .rotationEffect(Angle(degrees: -90))
    }
}

struct Time {
    var hour: Int
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        Clock(rotation: .constant(Time(hour: 240)), showOptions: true)
    }
}
