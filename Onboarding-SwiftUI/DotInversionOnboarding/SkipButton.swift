//
//  SkipButton.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI

struct SkipButton: View {
    
    var action: (() -> Void)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    action()
                }, label: {
                    Text("Skip")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                })
            }
            
            
        }
        .padding(.bottom, 45)
        .padding(.trailing, 35)
    }
}

struct SkipButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipButton(action: {})
    }
}
