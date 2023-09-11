//
//  customCapsule.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct customCapsule: View {
    
    @State var customHeight = 0
    @State var customWidth = 0
    @State var customCornerRadius = 0
    @State var customColor : Color = .black
    
    var body: some View {
        Capsule()
            .foregroundColor(customColor)
            .frame(width: CGFloat(customWidth),height: CGFloat(customHeight))
            .cornerRadius(CGFloat(customCornerRadius))
    }
}

struct customCapsule_Previews: PreviewProvider {
    static var previews: some View {
        customCapsule()
    }
}
