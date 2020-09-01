//
//  PainWishBackgroundView.swift
//  WishingWell
//
//  Created by Ryan Malesic on 8/22/20.
//

import SwiftUI

struct PainWishBackgroundView: View {
    let onTapWell: () -> Void
    
    var body: some View {
        ZStack {
            Color(red: 125 / 255, green: 238 / 255, blue: 255 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("Well")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                       onTapWell()
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PainWishBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        PainWishBackgroundView(onTapWell: {})
    }
}
