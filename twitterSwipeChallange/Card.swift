//
//  Card.swift
//  twitterSwipeChallange
//
//  Created by Mike Van Amburg on 4/22/20.
//  Copyright © 2020 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct Card: View {
    @State var img: String
    @State var name: String
    var body: some View {
        ZStack(alignment: .leading){
        RoundedRectangle(cornerRadius: 10)
            Image(img)
            .resizable()
            .cornerRadius(10.0)
            
        VStack{
            Spacer()
            Text(name)
                .bold()
                .font(.title)
                .foregroundColor(.white)
            }
        .padding(20)
            
        }
        .frame(width: 350, height: 400)
        
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(img: "cat2", name: "Mr Fluffers")
    }
}
