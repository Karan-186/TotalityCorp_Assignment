//
//  screenOneView.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct screenOneView: View {
    
    @State private var scale: CGFloat = 0.1
    @State private var xOffset: CGFloat = UIScreen.main.bounds.width // Initial X offset

    
    var body: some View {
        VStack{
            customRectangle(customHeight: 30,customWidth: 150,customCornerRadius: 5, customColor: .gray)
                .scaleEffect(scale)
                .onAppear {
                    // Animate the View in from the right
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            xOffset = 0
                        }
                    }
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        scale = 1.0
                    }
                }
            
            withAnimation{
                HStack{
                    VStack{
                        customCircle(customHeight: 100,customWidth: 100,customColor: .gray)
                        customRectangle(customHeight: 25,customWidth: 150,customCornerRadius: 5, customColor: .gray)
                        customRectangle(customHeight: 20,customWidth: 100,customCornerRadius: 5, customColor: .gray)
                    }
                    VStack{
                        customCircle(customHeight: 100,customWidth: 100,customColor: .gray)
                        customRectangle(customHeight: 25,customWidth: 150,customCornerRadius: 5, customColor: .gray)
                        customRectangle(customHeight: 20,customWidth: 100,customCornerRadius: 5, customColor: .gray)
                    }
                }
                .transition(.move(edge: .leading)) // Animate the view from right to left
                .offset(x: xOffset) // Apply the X offset for animation
                .padding()
            }
        }
    }
}

struct screenOneView_Previews: PreviewProvider {
    static var previews: some View {
        screenOneView()
    }
}
