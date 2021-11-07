//
//  FadingOnboardingView.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 03/11/2021.
//

import SwiftUI

struct FadingOnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var titles = [
        "Start Investing",
        "Follow Our Tips",
        "Keep Your Investments Safe"
    ]
    
    @State var subTitles = [
        "Order From Anywhere",
        "Pay Easy",
        "Delivered To Doors"
    ]
    
    @State var images = [
        "onboarding1",
        "onboarding2",
        "profile"
    ]
    
    @State var currentIndex: Int = 2
    
    @State var titleText: [TextAnimation] = []
    
    @State var subtitleAnimation = false
    @State var endAnimation = false
    
    
    var body: some View {
        
        ZStack {
            GeometryReader { proxy in
                
                let size = proxy.size
                
                if currentIndex == 0 {
                    ZStack {
                        Image("invest1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -100)
                            .frame(width: size.width, height: size.height)
                    }
                    .zIndex(1)
                    .transition(.opacity)
                } else if currentIndex == 1 {
                    ZStack {
                        Image("invest2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -100)
                            .frame(width: size.width, height: size.height)
                    }
                    .zIndex(1)
                    .transition(.opacity)
                } else {
                    ZStack {
                        Image("invest3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -100)
                            .frame(width: size.width, height: size.height)
                    }
                    .zIndex(1)
                    .transition(.opacity)
                }
                
                
                
                
                LinearGradient(gradient: Gradient(colors: [
                    Color.clear,
                    Color.black.opacity(0),
                    Color.black.opacity(0),
                    Color.black.opacity(0.2),
                    Color.black.opacity(0.8),
                    Color.black,
                ]),
                                                
                               startPoint: .top,
                               endPoint: .bottom)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                HStack(spacing: 0) {
                    ForEach(titleText) { text in
                        Text(text.text)
                            .offset(y: text.offset)
                    }
                    .font(.title.bold())
                }
                .offset(y: endAnimation ? -100 : 0)
                .opacity(endAnimation ? 0 : 1)
                
                Text(subTitles[currentIndex])
                    .opacity(0.8)
                    .offset(x: 0, y: subtitleAnimation ? 0 : 80)
                    .offset(y: endAnimation ? -100 : 0)
                    .opacity(endAnimation ? 0 : 1)
                
                
                SigninButton(text: "Continue with an account", onClick: {
                    
                }, isSystem: false)
                .padding(.top)
                
                
                SigninButton(text: "Skip for now", onClick: {
                    
                }, isSystem: true)
                
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
            VStack {
                HStack {
                    Text("Fading Onboarding")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            
            BackButton(action: {
                presentationMode.wrappedValue.dismiss()
            }, color: .black)
            .padding(.top, -15)
            
        }
        .onAppear {
            currentIndex = 0
        }
        .onChange(of: currentIndex) { newValue in
            
            getSplittedChars(text: titles[currentIndex]) {
                withAnimation(.easeOut(duration: 1)) { endAnimation = true }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                titleText.removeAll()
                subtitleAnimation = false
                endAnimation = false
                
                if currentIndex < (titles.count - 1) {
                    withAnimation { currentIndex += 1 }
                } else {
                    withAnimation { currentIndex = 0 }
                }
            }
            
        }
    }
    
    func getSplittedChars(text: String, completion: @escaping ()->()) {
        for (index,char) in text.enumerated() {
            titleText.append(TextAnimation(text: String(char)))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.03) {
                withAnimation {
                    titleText[index].offset = 0
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                completion()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(text.count) * 0.02) {
            withAnimation(.easeInOut(duration: 0.5)) {
                subtitleAnimation = true
            }
        }
        
    }
}

struct OFadingOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        FadingOnboardingView()
    }
}
