//
//  PeelAwayOnboardingView.swift
//  Onboarding-SwiftUI
//
//  Created by Marwan Osama on 04/11/2021.
//

import SwiftUI

struct PeelAwayOnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tabs = PeelScreenModel.screens
    @GestureState var isDragging: Bool = false
    @State var currentIndex: Int = 0
    @State var fakeIndex: Int = 0
    
    var body: some View {
        
        ZStack {
            
            ForEach(tabs.indices.reversed(), id: \.self) { index in
                GenerateTab(tab: tabs[index])
                    .clipShape(LiquidSwipe(offset: tabs[index].offset, curvePoint: currentIndex == index ? 50 : 0))
                    .padding(.trailing, currentIndex == index ? 15 : 0)
                    .ignoresSafeArea()
            }
            
            PeelPageIndicator(tabs: tabs, currentIndex: $fakeIndex)
            
            VStack {
                HStack {
                    Text("Peel Onboarding")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            
            BackButton(action: {
                presentationMode.wrappedValue.dismiss()
            }, color: .white)
            .padding(.top, -15)
        }
        .overlay(
            Button(action: {}, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.clear)
                    .font(.largeTitle)
                    .frame(width: 50, height: 50)
                    .contentShape(Rectangle())
                    .opacity(isDragging ? 0 : 1)
                    .animation(.linear, value: isDragging)
                    .gesture(
                        DragGesture()
                            .updating($isDragging, body: { value, out, _ in
                                out = true
                            })
                            .onChanged({ value in
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)) {
                                    tabs[currentIndex].offset = value.translation
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.spring()) {
                                  
                                    if -value.translation.width > DEVICE_WIDTH / 2 {
                                        
                                        tabs[currentIndex].offset.width = -DEVICE_HEIGHT * 1.5
                                        currentIndex += 1
                                        fakeIndex = fakeIndex == tabs.count - 3 ? 0 : fakeIndex + 1
                                                                            
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            if currentIndex == tabs.count - 2 {
                                                
                                                for index in 0..<tabs.count - 2 {
                                                    tabs[index].offset = .zero
                                                }
                                                
                                                currentIndex = 0
                                                
                                            }
                                        }
                                        
                                    } else {
                                        tabs[currentIndex].offset = .zero
                                    }
                                    
                                }
                            })
                    
                    )
            })
            .offset(y: (DEVICE_HEIGHT*0.17) - (DEVICE_HEIGHT*0.1))
            
            ,alignment: .topTrailing
    )
        .onAppear {
            guard let first = tabs.first else { return }
            guard var last = tabs.last else { return }
            last.offset.width = -DEVICE_HEIGHT * 1.5
            tabs.append(first)
            tabs.insert(last, at: 0)
            currentIndex = 1
        }
        
        
    }
    
    
    
    @ViewBuilder
    func GenerateTab(tab: PeelScreenModel) -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            tab.image
                .resizable()
                .scaledToFit()
                .frame(width: DEVICE_WIDTH * 0.8, height: DEVICE_HEIGHT * 0.55)
                .padding(.top, -80)
            
            
            Text(tab.title)
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .medium))
                .padding(.horizontal, 20)
                .padding(.top, 30)
            
            Text(tab.subTitle)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .regular))
                .padding(.horizontal, 20)
                .padding(.top, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            tab.color
        )
        
    }
}

struct PeelAwayOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        PeelAwayOnboardingView()
    }
}
