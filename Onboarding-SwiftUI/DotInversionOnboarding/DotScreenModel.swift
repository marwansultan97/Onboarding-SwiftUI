//
//  DotScreenModel.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 03/11/2021.
//

import Foundation
import SwiftUI

struct DotScreenModel: Identifiable {
    var id: String {
        return title
    }
    var title: String
    var subTitle: String
    var color: Color
    var image: Image
}

extension DotScreenModel {
    
    static let screens: [DotScreenModel] = [
        .init(title: "Connect with tourists",
              subTitle: "Connect with people of faith locally & globally.\nDiscover Chat & Engage",
              color: Color("travelColor1"),
              image: Image("travel1")),
        
        .init(title: "Discover New Things",
              subTitle: "Explore new things through our app. Discover\ninitiary & other stuff.",
              color: Color("travelColor2"),
              image: Image("travel2")),
        
        .init(title: "Share your moments",
              subTitle: "Share you trip initiary with others. Let's make\nthe travel fun and enjoyable.",
              color: Color("travelColor3"),
              image: Image("travel3"))
    ]
}
