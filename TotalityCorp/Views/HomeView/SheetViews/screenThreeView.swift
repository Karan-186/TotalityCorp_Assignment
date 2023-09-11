//
//  screenThreeView.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct screenThreeView: View {
    
    @State private var capsuleOffset: CGFloat = UIScreen.main.bounds.width // Initial X offset
    @State private var thirdOffsetY: CGFloat = -50 // Initial Y offset


    var body: some View {
            VStack{
                VStack{
                    VStack{
                        Text("Ready To Play?")
                            .padding(.vertical,5)
                            .foregroundColor(.black)
                        Text("OSWALD")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical,20)

                    HStack{
                        customRectangle(customHeight: 30,customWidth: 100,customCornerRadius: 5, customColor: .gray)
                        customRectangle(customHeight: 30,customWidth: 40,customCornerRadius: 5, customColor: .gray)
                    }
                }
                .offset(y: thirdOffsetY)
                .onAppear {
                    // Animate the capsule View in from the right
                    withAnimation(.easeInOut(duration: 0.5)) {
                        thirdOffsetY = 0
                    }
                }
                .onAppear {
                    // Animate the capsule View in from the right
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            capsuleOffset = 0
                        }
                    }
                }
                HStack{
                    customCapsule(customHeight: 80,customWidth: 100,customColor: .gray)
                    customCapsule(customHeight: 80,customWidth: 100,customColor: .gray)
                    customCapsule(customHeight: 80,customWidth: 100,customColor: .gray)
                    
                }
                .transition(.move(edge: .leading)) // Animate the capsule View from right to left
                .offset(x: capsuleOffset) // Apply the X offset for animation
                .padding()
                .padding()
            }
    }
}

struct screenThreeView_Previews: PreviewProvider {
    static var previews: some View {
        screenThreeView()
    }
}
