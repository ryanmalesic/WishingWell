//
//  PainWishReflectView.swift
//  WishingWell
//
//  Created by Ryan Malesic on 8/22/20.
//

import SwiftUI

struct PainWishReflectView: View {
    @Binding var pain: String
    @Binding var wish: String
    
    
    @State var stage: Int = 1
    @State var isCenter: Bool = true
    @State var isCenter2: Bool = true
    
    let numCircles = 6
    
    var body: some View {
        VStack {
            Spacer()
            
            if (stage == 1) {
                Text("Reflect on \(pain)")
                    .font(Font.system(size: 15, weight: .medium, design: .rounded))
                    .transition(.opacity)
                    .id("abc123")
            } else {
                Text("Reflect on \(wish)")
                    .font(Font.system(size: 15, weight: .medium, design: .rounded))
                    .transition(.opacity)
                    .id("123abc")
            }
            
            if (stage == 1) {
                Text("Tap the visualization to continue")
                    .font(Font.system(size: 15, weight: .medium, design: .rounded))
                    .transition(.opacity)
                    .id("def456")
            } else {
                Text("Tap the well to start over")
                    .font(Font.system(size: 15, weight: .medium, design: .rounded))
                    .transition(.opacity)
                    .id("456def")
            }
            
            Spacer()
            
            ZStack {
                ForEach(0..<numCircles) { index in
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.blue.opacity(0.5))
                        .offset(x: isCenter ? 0 : 35 * cos(CGFloat(360 / numCircles * index) * .pi / 180.0), y: isCenter ? 0 : 35 * sin(CGFloat(360 / numCircles * index) * .pi / 180))
                        .rotationEffect(Angle(degrees: isCenter2 ? 0 : 360))
                }
            }
            .onAppear {
                let animation = Animation.linear(duration: 5)
                withAnimation(animation.repeatForever(autoreverses: true)) {
                    self.isCenter = false
                }
                withAnimation(animation.repeatForever(autoreverses: false)) {
                    self.isCenter2 = false
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 2.0)) {
                    stage = stage + 1
                }
            }
            
            Spacer()
            Spacer()
        }
    }
}

struct PainWishReflectView_Previews: PreviewProvider {
    static var previews: some View {
        PainWishReflectView(pain: .constant(""), wish: .constant(""))
    }
}
