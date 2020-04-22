//
//  ContentView.swift
//  twitterSwipeChallange
//
//  Created by Mike Van Amburg on 4/22/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGSize = .zero
    @State private var currentCard = 0
    
    
    @State private var didJustSwipe = false
    
    func offset(for i: Int) -> CGSize {
        return i == currentCard ? offset : .zero
    }
    var body: some View {
        ZStack{
            ForEach(currentCard..<20, id: \.self) { i in
                Card(img: "cat2", name: "Mr Fluffers")
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
                       self.didJustSwipe = true
                       let x = w > 0 ? 1000 : -1000
                       self.offset = .init(width: x, height: 0)
                    
                   } else {
                       self.offset = .zero
                   }
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
