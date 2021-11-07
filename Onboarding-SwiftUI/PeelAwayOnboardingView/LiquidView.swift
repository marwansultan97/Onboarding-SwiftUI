//
//  LiquidSwipe.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI

struct LiquidSwipe: Shape {
    
    var topPoint =  DEVICE_HEIGHT*0.1
    var bottomPoint = DEVICE_HEIGHT*0.2
    
    var offset: CGSize
    var curvePoint: CGFloat
    
    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat> {
        get { return AnimatablePair(offset.animatableData, curvePoint) }
        set { offset.animatableData = newValue.first ; curvePoint = newValue.second }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let from = topPoint + offset.width
            var to = bottomPoint + offset.height + (-offset.width)
            to = to < bottomPoint ? bottomPoint : to
            path.move(to: CGPoint(x: rect.width, y: from > topPoint ? topPoint : from))
            
            let mid: CGFloat = topPoint + ((to - topPoint)/2)
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - curvePoint, y: mid), control2: CGPoint(x: width - curvePoint, y: mid))
            
            
            
            
        }
    }
    
    
}

struct LiquidSwipe_Previews: PreviewProvider {
    static var previews: some View {
        LiquidSwipe(offset: CGSize(width: 100, height: 100), curvePoint: 0)
    }
}
