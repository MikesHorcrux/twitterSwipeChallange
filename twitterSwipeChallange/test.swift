//
//  test.swift
//  twitterSwipeChallange
//
//  Created by Mike Van Amburg on 4/22/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct test: View {
    @State private var offset: CGSize = .zero
    @State private var currentCard = 0
    @State private var didJustSwipe = false

    var randomView: some View {
        ZStack{
        Rectangle()
            .foregroundColor(.green)
            .cornerRadius(20)
            .frame(width: 350, height: 350)
            .padding()
        Text("\(currentCard)")
        }
    }

    func offset(for i: Int) -> CGSize {
        return i == currentCard ? offset : .zero
    }

    var body: some View {
        ZStack{
            ForEach(currentCard..<16, id: \.self) { i in
                self.randomView
                    .offset(self.offset(for: i))
                    .gesture(self.gesture)
                    .animation(.spring())
            }
        }
    }

    var gesture: some Gesture {
        DragGesture()
            .onChanged {
                if self.didJustSwipe {
                    self.didJustSwipe = false
                    self.currentCard += 1
                    self.offset = .zero
                } else {
                    self.offset = $0.translation
                }
        }
            .onEnded {
                
                let w = $0.translation.width
                if abs(w) > 100 {
                    print("Swipe Left")
                    self.didJustSwipe = true
                    let x = w > 0 ? 1000 : -1000
                    self.offset = .init(width: x, height: 0)
                } else {
                    print("Swipe Left")
                    self.offset = .zero
                }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
