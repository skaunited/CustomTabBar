//
//  TabShape.swift
//  Curved Custom TabBar
//
//  Created by Work Flow Dev on 20/05/2023.
//

import SwiftUI

struct TabShape: Shape {
    var midPoint: CGFloat
    /// Adding shape animation
    var animatableData: CGFloat {
        get { midPoint }
        set {
            midPoint = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            /// Drawing the rectangle shape
            path.addPath(Rectangle().path(in: rect))
            /// Drawing the upward curve shape
            path.move(to: .init(x: midPoint - 60, y: 0))
            
            let to = CGPoint(x: midPoint, y: -25)
            let control1 = CGPoint(x: midPoint - 25, y: 0)
            let control2 = CGPoint(x: midPoint - 25, y: -25)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to1 = CGPoint(x: midPoint + 60, y: 0)
            let control3 = CGPoint(x: midPoint + 25, y: -25)
            let control4 = CGPoint(x: midPoint + 25, y: 0)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
