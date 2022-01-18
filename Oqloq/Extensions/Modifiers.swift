//
//  Modifiers.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 18.01.2022.
//

import SwiftUI

struct HangerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
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
            .shadow(color: Color.black.opacity(0.25), radius: 20, x: 30, y: 0)
    }
}

struct RectangleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 55, height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 5,style: .continuous))
            .offset(y: 30)
            .shadow(color: .black.opacity(0.25), radius: 20, x: 30, y: 0)
    }
}
