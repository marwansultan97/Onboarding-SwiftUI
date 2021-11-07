//
//  PeelScreenModel.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI

struct PeelScreenModel: Identifiable {
    var id: String {
        return title
    }
    var title: String
    var subTitle: String
    var color: Color
    var image: Image
    var offset: CGSize = .zero
}

extension PeelScreenModel {
    
    static let screens: [PeelScreenModel] = [
        .init(title: "We Help You Get Better",
              subTitle: "No Matter What Sport You Play",
              color: Color("sportColor1"),
              image: Image("sport1")),
        
        .init(title: "Analyze Your Every Move",
              subTitle: "Detailed Stats On How You Play And How To Improve",
              color: Color("sportColor2"),
              image: Image("sport2")),
        
        .init(title: "Motivation Everyday",
              subTitle: "Stay Motivated And See Daily Progress",
              color: Color("sportColor3"),
              image: Image("sport3"))
    ]
}
