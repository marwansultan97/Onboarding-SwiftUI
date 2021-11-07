//
//  BackButton.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 07/11/2021.
//

import SwiftUI

struct BackButton: View {
    
    var action: (() -> Void)
    var color: Color
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    action()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(color)
                })
                Spacer()
            }
            Spacer()
        }
        .padding()
        
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(action: {}, color: .black)
    }
}
