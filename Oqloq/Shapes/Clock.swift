//
//  Clock.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 8.10.2021.
//

import SwiftUI

struct Clock: View {
//    var rotation: ClockEngine.Timeline.rotation
//    @Binding var timelines: Array<TimelineView>
    
    @State var show: Bool = false
    @State var showOptions = false
        
    var body: some View {
        let mainColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]), startPoint: .bottom, endPoint: .top)
        let indicatorColor = Color.white
        return VStack(spacing: 0) {
//MARK: - Hanger
            Hanger()
                .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.25))
                            .padding(4)
                            .shadow(color: .black.opacity(0.8), radius: 20, x: 20, y: 0)
                        Circle()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .padding(4)
                        Text("oqloq")
                            .foregroundColor(.white)
                            .font(.custom("Alata-Regular", size: 17))
                            .opacity(0.1)
                    }
                        .offset(y: -5)
                )
                .frame(width: 60, height: 75)
                .offset(y: 40)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
            //Hanger
            Rectangle()
                .fill(mainColor)
                .frame(width: 55, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 5,style: .continuous))
                .offset(y: 30)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
//MARK: - Clock Body
            ZStack {
                //back
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(1)]), center: .center, startRadius: 50, endRadius: 500))
                    .frame(width: 380, height: 380)
//                    .blur(radius: 100)
                    .blendMode(.color)
                //main body
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
                    .frame(width: 340, height: 340)
                //indicator
                Circle()
                    .trim(from: 0.0, to: 0.002)
                    .stroke(indicatorColor, lineWidth: 60)
                    .frame(width: 280, height: 280)
                    .rotationEffect(Angle(degrees: -90))
                    // indicator rotation effect
//                    .rotationEffect(Angle(degrees: Double(rotation.hour) * 15))
                ColoredCircle(amountOfTimelines: 1)
            }
            .contextMenu {
                Button {
                    //add timeline
                } label: {
                    Label("Add timeline", systemImage: "plus")
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
    var amountOfTimelines: Int
    var angle: Float = 0
    var color: Color = Color.white
    var startPoint: Float = 0
    var endPoint: Float = 0.3
    
    var body: some View {
        ZStack {
            
            ForEach(0..<amountOfTimelines) { index in
                //TODO: - Fix color here
                Timeline(timeline: ClockEngine.Timeline(angle: angle, color: "ffffff", startPoint: startPoint, endpoint: endPoint))
            }
        }
    }
}

struct Timeline: View {
    var timeline: ClockEngine.Timeline
    @State var editPositon = false
    @State var editLength = false
    
    var lineWidth: CGFloat = 3
    var body: some View {
        Circle()
            .trim(from: CGFloat(timeline.startPoint), to: CGFloat(timeline.endpoint))
        //TODO: - Fix Color here
            .stroke(Color(hex: timeline.color).opacity(0.8),
                    style: StrokeStyle(lineWidth: editPositon ? 15 : editLength ? 15 : lineWidth, lineCap: .round, lineJoin: .round))
            .frame(width: 380, height: 380)
            .rotationEffect(.degrees(Double(timeline.angle)))
//            .onLongPressGesture {
//                withAnimation(.interactiveSpring()) {
//                    showOptions.toggle()
//                }
//            }
            .contextMenu {
                Button {
                    //delete action
                } label: {
                    Label("Delete", systemImage: "trash.fill")
                }
                Button {
                    //edit Position
                } label: {
                    Label("Edit position",systemImage: "gear")
                }
                Button {
                    //edit length
                } label: {
                    Label("Edit length",systemImage: "scribble")
                }
//                ColorPicker("Change color",
//                            selection: timeline.color
//                ) //only buttons are working here
            }
//            .gesture(DragGesture()
//                        .onChanged{ value in
//                            if editPositon {
//                                self.angle = atan2(value.location.x - self.length / 2, self.length / 2 - value.location.y) * 180 / .pi
//                                if (self.angle < 0) { self.angle += 360 }
//                            } else if editLength {
//                                withAnimation(.interactiveSpring()) {
//                                    self.endpoint = value.location.y
//                                }
//                            }
//
//                        }
//            )
//            .onTapGesture {
//                withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0.5)) {
//                    editPositon = false
//                    editLength = false
//                }
//            }
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Clock()
        }
    }
}
