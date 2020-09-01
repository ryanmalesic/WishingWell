//
//  PainWishView.swift
//  WishingWell
//
//  Created by Ryan Malesic on 8/22/20.
//

import SwiftUI

enum PainWishState {
    case enter
    case reflect
}

struct PainWishView: View {
    @State private var pain: String = ""
    @State private var wish: String = ""
    @State private var state: PainWishState = .enter
    
    func toggleState() {
        if self.state == .enter && !self.pain.isEmpty && !self.wish.isEmpty {
            withAnimation(.easeInOut(duration: 2)) {
                self.state = .reflect
            }
        } else if self.state == .reflect {
            withAnimation(.easeInOut(duration: 2)) {
                self.state = .enter
                self.pain = ""
                self.wish = ""
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top){
            PainWishBackgroundView {
               toggleState()
            }
            
            ZStack {
                if self.state == .enter {
                    PainWishEnterView(pain: $pain, wish: $wish)
                } else {
                    PainWishReflectView(pain: $pain, wish: $wish)
                }
            }
        }
    }
}

struct PainWishView_Previews: PreviewProvider {
    static var previews: some View {
        PainWishView()
    }
}
