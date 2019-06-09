//
//  DetailView.swift
//  Navigation
//
//  Created by Caleb Wells on 6/8/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct DetailView : View {
    var body: some View {
        VStack {
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 72.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .shadow(color: Color.black, radius: 12, x: 0, y: 0)

            Text("Hello Pizza!")
                .font(.largeTitle)
                .padding(.top, 24)
            
            Text("This looks like a really good pizza to eat. You should put some more text here soon.")
                .multilineTextAlignment(.leading)
                .lineLimit(6)
                .padding()
            
            .padding()
            
            Button(action: handleButtonTap) {
                HStack {
                    Image(systemName: "creditcard")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Order")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .color(.white)
                }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
    }
    
    func handleButtonTap() {
        print("\n=== Order ===")
    }
}

#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView { DetailView() }
    }
}
#endif
