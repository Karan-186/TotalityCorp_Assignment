//
//  AppScreen.swift
//  TotalityCorp
//
//  Created by KARAN D on 09/09/23.
//

import SwiftUI

struct AppScreen: View {
    
    @Namespace var namespace
    
    var body: some View {
        VStack{
            
            HStack(alignment: .top){
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
                    .padding()
                VStack(alignment: .leading){
                    Text("CANDY")
                    Text("BUST")
                }
                .font(.title3)
                .fontDesign(.serif)
                .padding()
                Spacer()
                Image(systemName: "xmark")
                    .padding(.vertical)
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("What is Lorem Ipsum?Lorem Ipsum is simply")
                Text("dummy text of the printing and typesetting")
            }
            .fontDesign(.serif)
            .padding(.vertical)
            
            VStack(alignment: .center){
                Text("READ MORE")
            }
            .foregroundColor(.green)
            
            
            Rectangle()
                .frame(width: 200, height: 350)
                .foregroundColor(.gray)
            
            
            Button(action: {
                // Action to be performed when the button is tapped
            }) {
                VStack(alignment: .center){
                    Text("DOWNLOAD")
                    Text("30 MB")
                }
                .foregroundColor(.white)
                .fontDesign(.serif)
                .padding()
                .background(
                    Capsule() // Creates a cylindrical shape
                        .foregroundColor(.blue) // Color of the cylindrical button
                )
            }
        }
    }
}


struct AppScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppScreen()
    }
}

