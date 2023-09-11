//
//  customRectangle.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct customRectangle: View {
    
    @State var customHeight = 0
    @State var customWidth = 0
    @State var customCornerRadius = 0
    @State var customColor : Color = .black
    
    var body: some View {
        Rectangle()
            .foregroundColor(customColor)
            .frame(width: CGFloat(customWidth),height: CGFloat(customHeight))
            .cornerRadius(CGFloat(customCornerRadius))
    }
}

struct customRectangle_Previews: PreviewProvider {
    static var previews: some View {
        customRectangle()
    }
}
