//
//  DotInversionOnboardingView.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 03/11/2021.
//

import SwiftUI

struct DotInversionOnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var dotState: DotState = .normal
    @State var dotScale: CGFloat = 1
    @State var rotation: Double = 0
    @State var isAnimating = false
    @State var currentIndex: Int = 0
    @State var nextIndex: Int = 1    
    @State var tabs = DotScreenModel.screens
    
    
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                (dotState == .normal ? tabs[currentIndex].color : tabs[nextIndex].color)
                
                dotState == .normal ? AnyView(ExpandedView()) : AnyView(MinimisedView())
            }
            .animation(.none, value: dotState)
            
            Rectangle()
                .fill((dotState != .normal ?  tabs[currentIndex].color : tabs[nextIndex].color))
                .overlay(
                    dotState != .normal ? AnyView(ExpandedView()) : AnyView(MinimisedView())
                )
                .animation(.none, value: dotState)
                .mask(
                    GeometryReader { reader in
                         Circle()
                            .frame(width: 80, height: 80)
                            .scaleEffect(dotScale)
                            .rotation3DEffect(
                                .init(degrees: rotation),
                                axis: (x: 0.0, y: 1.0, z: 0.0),
                                anchor: .center,
                                anchorZ: dotState == .flipped ? -20 : 20,
                                perspective: 1.0
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .offset(y: -20)
                    }
                )
            
            Circle()
                .fill(Color.black.opacity(0.01))
                .overlay(
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .scaleEffect(1.5)
                        .opacity(rotation == -180 ? 0 : 1)
                        .animation(.easeInOut, value: rotation)
                )
                .frame(width: 80, height: 80)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .onTapGesture {
                    
                    guard !isAnimating else { return }
                    isAnimating = true
                    
                    
                    withAnimation(.linear(duration: 1)) {
                        dotScale = 8
                        rotation = -180
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.52) {
                        withAnimation(.easeInOut(duration: 0.48)) {
                            dotState = .flipped
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.52) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            dotScale = 1
                        }
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            rotation = 0
                            dotState = .normal
                            currentIndex = nextIndex
                            nextIndex = getNextIndex()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isAnimating = false
                        }
                    }
                }
                .offset(y: -20)

            
            PageIndicator(tabs: $tabs, currentIndex: $currentIndex)
            
            SkipButton(action: {
                
            })
            
            VStack {
                HStack {
                    Text("Dot Inversion Onboarding")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading, 15)
            
            BackButton(action: {
                presentationMode.wrappedValue.dismiss()
            }, color: .white)
            .padding(.top, 32)
            
        }
        .ignoresSafeArea()
        
        
        
        
    }
    
    func getNextIndex() -> Int {
        
        if nextIndex == tabs.count - 1 {
            return 0
        } else {
            return (nextIndex + 1)
        }
    }
    
    @ViewBuilder
    func tabView(tab: DotScreenModel) -> some View {
        VStack(alignment: .leading) {
            tab.image
                .resizable()
                .scaledToFit()
                .padding(.top, -150)
            
            Text(tab.title)
                .font(.system(size: 30, weight: .semibold))
                .padding(.top, 20)
            
            Text(tab.subTitle)
                .font(.system(size: 15))
                .padding(.top, 5)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 30)
    }
    
    
    @ViewBuilder
    func ExpandedView() -> some View {
        tabView(tab: tabs[currentIndex])
    }
    
    @ViewBuilder
    func MinimisedView() -> some View {
        tabView(tab: tabs[nextIndex])
    }
    
    
    
}

struct DotInversionOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        DotInversionOnboardingView()
    }
}



enum DotState {
    case normal
    case  flipped
}
