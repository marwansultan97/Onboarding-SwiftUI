//
//  TextAnimation.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 03/11/2021.
//

import SwiftUI

struct TextAnimation: Identifiable {
    var id = UUID().uuidString
    var text: String
    var offset: CGFloat = 110
}
