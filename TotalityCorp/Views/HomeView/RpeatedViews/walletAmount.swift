//
//  walletAmount.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct walletAmount: View {
    
    @State var customText = ""
    @State var customCircleColor : Color = .black
    
    var body: some View {
        ZStack{
            customCircle(customHeight: 70,customWidth: 100,customColor: customCircleColor)
            Text(customText)
                .foregroundColor(.white)
        }
    }
}

struct walletAmount_Previews: PreviewProvider {
    static var previews: some View {
        walletAmount()
    }
}
