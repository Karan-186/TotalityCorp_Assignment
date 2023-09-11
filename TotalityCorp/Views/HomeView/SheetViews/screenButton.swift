//
//  screenButton.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct screenButton: View {
    
    @Namespace var namespace
    @Binding var numScreen : Int


    var body: some View {
        Button {
            //make button incative as numScreen reaches 3
            if(numScreen<3){
                numScreen = numScreen + 1
            }
        } label: {
            ZStack(alignment: .center) {
                
                //Change the color as downalod completes
                if(numScreen == 3){
                    customCapsule(customHeight: 70,customWidth: 350,customColor: .gray)
                }else{
                    customCapsule(customHeight: 70,customWidth: 350,customColor: .green)
                }
                VStack{
                    
                    //Change the text based on the downloading progress
                    if(numScreen==3){
                        Text("Confirm")
                            .matchedGeometryEffect(id: "text", in: namespace)
                            .foregroundColor(.white)
                            .font(.title3)
                    }else{
                        Text("NEXT")
                            .matchedGeometryEffect(id: "text", in: namespace)
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                }
            }
            .matchedGeometryEffect(id: "PLAY", in: namespace)
        }
    }
}

struct screenButton_Previews: PreviewProvider {
    static var previews: some View {
        screenButton(numScreen: .constant(1))
    }
}
