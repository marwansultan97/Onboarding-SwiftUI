//
//  View+Extension.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI


extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        guard let window = screen.windows.first?.safeAreaInsets else { return .zero}
        return window
    }
}
