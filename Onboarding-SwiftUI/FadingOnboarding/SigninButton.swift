//
//  SigninButton.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI

struct SigninButton: View {
    
    var text: String
    var onClick: ()->()
    var isSystem: Bool
    
    var body: some View {
        
        Text(text)
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .fontWeight(.semibold)
            .frame(width: DEVICE_WIDTH * 0.9, height: 50, alignment: .center)
            .foregroundColor(isSystem ? .white : .black)
            .background(
                Color.white.opacity(!isSystem ? 1 : 0.2).clipShape(Capsule())
            )
            .onTapGesture {
                onClick()
            }
    }
}

struct SigninButton_Previews: PreviewProvider {
    static var previews: some View {
        SigninButton(text: "", onClick: {}, isSystem: true)
    }
}
