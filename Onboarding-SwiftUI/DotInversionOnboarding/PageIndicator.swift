//
//  PageIndicator.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI

struct PageIndicator: View {
    
    @Binding var tabs: [DotScreenModel]
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabs) { tab in
                    Circle()
                        .fill(tab.title == tabs[currentIndex].title ? Color.white : Color.white.opacity(0.2))
                        .frame(width: 10, height: 10)
                }
            }
        }
        .padding(.bottom, DEVICE_HEIGHT * 0.15)
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(tabs: .constant([]), currentIndex: .constant(1))
    }
}
