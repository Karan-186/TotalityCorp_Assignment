//
//  sheetView.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct sheetView: View {
            
    @State var numScreen = 1
    @State private var offsetY: CGFloat = 20
    
    var body: some View {
        VStack{
            
            if(numScreen == 1){
                screenOneView()
            }else{
                if(numScreen == 2){
                    screenSecondView()
                }else{
                    screenThreeView()
                }
                
                //View that is constant in both screen 2 and 3
                HStack{
                    HStack{
                        Text("Wallet Balance:")
                            .foregroundColor(.black)
                        customRectangle(customHeight: 30,customWidth: 70,customCornerRadius: 5, customColor: .gray)
                    }
                    .padding(.horizontal)
                    Spacer()
                    customRectangle(customHeight: 30,customWidth: 50,customCornerRadius: 5, customColor: .gray)
                    customRectangle(customHeight: 20,customWidth: 30,customCornerRadius: 5, customColor: .gray)
                }
                .offset(y: offsetY)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        offsetY = 0
                    }
                }
                .padding()
                
            }
            //Button on sheet View
            screenButton(numScreen: $numScreen)
        }
    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        sheetView()
    }
}
