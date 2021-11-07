//
//  PeelPageIndicator.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 05/11/2021.
//

import SwiftUI

struct PeelPageIndicator: View {
    
    var tabs: [PeelScreenModel]
    @Binding var currentIndex: Int
        
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(0..<tabs.count-2, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color.white : Color.white.opacity(0.2))
                        .frame(width: 10, height: 10)
                }
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Skip")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                })
                .padding(.trailing, 20)
            }
            .padding(.horizontal, 40)
        }
        .padding(.bottom, DEVICE_HEIGHT * 0.02)
        
    }

    
}

