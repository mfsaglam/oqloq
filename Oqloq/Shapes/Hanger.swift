//
//  Hanger.swift
//  Oqloq
//
//  Created by Fatih Sağlam on 19.10.2021.
//

import SwiftUI

struct Hanger: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99346*width, y: 0.2006*height))
        path.addCurve(to: CGPoint(x: 0.78173*width, y: 0.00599*height), control1: CGPoint(x: 0.99346*width, y: 0.08683*height), control2: CGPoint(x: 0.86317*width, y: 0.00599*height))
        path.addLine(to: CGPoint(x: 0.20915*width, y: 0.00599*height))
        path.addCurve(to: CGPoint(x: 0.00327*width, y: 0.18862*height), control1: CGPoint(x: 0.14052*width, y: 0.00699*height), control2: CGPoint(x: 0.00327*width, y: 0.04491*height))
        path.addCurve(to: CGPoint(x: 0.00327*width, y: 0.99401*height), control1: CGPoint(x: 0.00327*width, y: 0.33234*height), control2: CGPoint(x: 0.00327*width, y: 0.78543*height))
        path.addLine(to: CGPoint(x: 0.03922*width, y: 0.99401*height))
        path.addLine(to: CGPoint(x: 0.03922*width, y: 0.88623*height))
        path.addCurve(to: CGPoint(x: 0.08497*width, y: 0.85329*height), control1: CGPoint(x: 0.03922*width, y: 0.87525*height), control2: CGPoint(x: 0.03922*width, y: 0.85329*height))
        path.addCurve(to: CGPoint(x: 0.93158*width, y: 0.85329*height), control1: CGPoint(x: 0.13072*width, y: 0.85329*height), control2: CGPoint(x: 0.64937*width, y: 0.85329*height))
        path.addCurve(to: CGPoint(x: 0.95763*width, y: 0.88623*height), control1: CGPoint(x: 0.96024*width, y: 0.85329*height), control2: CGPoint(x: 0.95763*width, y: 0.87425*height))
        path.addLine(to: CGPoint(x: 0.95763*width, y: 0.99401*height))
        path.addLine(to: CGPoint(x: 0.99346*width, y: 0.99401*height))
        path.move(to: CGPoint(x: 0.99346*width, y: 0.2006*height))
        path.addCurve(to: CGPoint(x: 0.99346*width, y: 0.99401*height), control1: CGPoint(x: 0.99346*width, y: 0.32515*height), control2: CGPoint(x: 0.99346*width, y: 0.78144*height))
        path.move(to: CGPoint(x: 0.99346*width, y: 0.2006*height))
        path.addLine(to: CGPoint(x: 0.99346*width, y: 0.99401*height))
        return path
    }
}

struct Hanger_Previews: PreviewProvider {
    static var previews: some View {
        Hanger()
            .fill()
    }
}
