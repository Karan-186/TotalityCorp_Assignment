//
//  screenSecondView.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct screenSecondView: View {
    
    @State private var secondScale: CGFloat = 0.1
    @State private var circleOffset: CGFloat = UIScreen.main.bounds.width // Initial X offset


    var body: some View {
        VStack{
            customRectangle(customHeight: 40,customWidth: 250,customCornerRadius: 5, customColor: .gray)
                .scaleEffect(secondScale)
                .padding()
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        secondScale = 1.0
                    }
                }
            
            customRectangle(customHeight: 30,customWidth: 200,customCornerRadius: 5, customColor: .gray)
                .padding()
                .onAppear {
                    // Animate the walletAmountScreen in from the right
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            circleOffset = 0
                        }
                    }
                }
            
            withAnimation{
                HStack{
                    walletAmount(customText: "5",customCircleColor : .green)
                    walletAmount(customText: "10",customCircleColor : .gray)
                    walletAmount(customText: "15",customCircleColor : .gray)
                }
                .transition(.move(edge: .leading)) // Animate the walletAmountScreen from right to left
                .offset(x: circleOffset) // Apply the X offset for animation
                .padding()
            }
        }
    }
}

struct screenSecondView_Previews: PreviewProvider {
    static var previews: some View {
        screenSecondView()
    }
}
