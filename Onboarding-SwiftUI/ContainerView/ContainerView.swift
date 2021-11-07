//
//  ContainerView.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 07/11/2021.
//

import SwiftUI

struct ContainerView: View {
    
    @State var navigateToPeel: Bool = false
    @State var navigateToDot: Bool = false
    @State var navigateToFading: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center, spacing: 40) {
                NavigationButton(action: {
                    navigateToPeel = true
                }, title: "Peel Onboarding", color: Color("travelColor1"))
                
                NavigationButton(action: {
                    navigateToDot = true
                }, title: "Dot Inversion Onboarding", color: Color("travelColor2"))
                
                NavigationButton(action: {
                    navigateToFading = true
                }, title: "Fading Onboarding", color: Color("sportColor3"))
            }
            .font(.system(size: 25, weight: .semibold))
        }
        
        .fullScreenCover(isPresented: $navigateToPeel, content: {
            PeelAwayOnboardingView()
        })
        
        .fullScreenCover(isPresented: $navigateToDot, content: {
            DotInversionOnboardingView()
        })
        
        .fullScreenCover(isPresented: $navigateToFading, content: {
            FadingOnboardingView()
        })
        
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}

struct NavigationButton: View {
    
    var action: (() -> Void)
    var title: String
    var color: Color
    
    var body: some View {
        
        
        Button(action: {
            action()
        }, label: {
            ZStack {
                color
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold, design: .serif))
            }
            .cornerRadius(20)
            .frame(width: 300, height: 80)
            
        })
    }
}
