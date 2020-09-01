//
//  PainWishEnterView.swift
//  WishingWell
//
//  Created by Ryan Malesic on 8/22/20.
//

import SwiftUI

struct PainWishEnterView: View {
    @Binding var pain: String
    @Binding var wish: String
    
    @State private var painOffset: CGSize = .zero
    @State private var wishOffset: CGSize = .zero
    @State private var textOpacity: Double = 0
    
    let circleDiameter = UIScreen.main.bounds.width * 5 / 14
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Tap the well to reflect")
                .font(Font.system(size: 15, weight: .medium, design: .rounded))
                .opacity(self.textOpacity)
                .onChange(of: self.pain) { value in
                    withAnimation(.easeInOut(duration: 2.0)) {
                        self.textOpacity = value.isEmpty || self.wish.isEmpty ? 0.0 : 1.0
                    }
                }
                .onChange(of: self.wish) { value in
                    withAnimation(.easeInOut(duration: 2.0)) {
                        self.textOpacity = self.pain.isEmpty || value.isEmpty ? 0.0 : 1.0
                    }
                }
            
            Spacer()
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .padding()
                        .foregroundColor(.white)
                    TextField("Pain", text: $pain)
                        .font(Font.system(size: 15, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .onChange(of: self.pain) { value in
                            withAnimation(.easeInOut(duration: 2.0)) {
                                self.painOffset = value.isEmpty ? .zero : .init(width: 0, height: 50)
                            }
                        }
                        .frame(width: circleDiameter - 40)
                }
                .frame(width: circleDiameter, height: 75 )
                .offset(painOffset)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .padding()
                        .foregroundColor(.white)
                    TextField("Wish", text: $wish)
                        .font(Font.system(size: 15, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .onChange(of: self.wish) { value in
                            withAnimation(.easeInOut(duration: 2.0)) {
                                self.wishOffset = value.isEmpty ? .zero : .init(width: 0, height: 50)
                            }
                        }
                        .frame(width: circleDiameter - 40)
                }
                .frame(width: circleDiameter, height: 75 )
                .offset(wishOffset)
            }
            .padding()
            
            Spacer()
            Spacer()
        }
    }
}

struct PainWishEnterView_Previews: PreviewProvider {
    static var previews: some View {
        PainWishEnterView(pain: .constant(""), wish: .constant(""))
    }
}
