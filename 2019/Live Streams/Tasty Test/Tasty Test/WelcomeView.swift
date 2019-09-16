//
//  WelcomeView.swift
//  Tasty Test
//
//  Created by Caleb Wells on 9/15/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 93/255, green: 188/255, blue: 240/255))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Quick question:")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("Are you a\nvegetarian?")
                    .font(.system(size: 55))
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    print("Tapped burger!")
                })
                {
                    HStack {
                        Image("burger")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 88, height: 88, alignment: .leading)
                        
                        Text("Nope, show me\nall recipes")
                            .fontWeight(.heavy)
                            .lineLimit(2)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .padding(.bottom)
                                
                Button(action: {
                    print("Tapped apple!")
                    
                }) {
                    HStack {
                        Image("apple")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 88, height: 88, alignment: .leading)
                        
                        Text("Yes, hide recipes\nwith meat")
                            .fontWeight(.heavy)
                            .lineLimit(2)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    }
                }
                .background(Color.white)
                .cornerRadius(8)

            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
