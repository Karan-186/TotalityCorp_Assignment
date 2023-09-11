//
//  ButtonView.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct ButtonView: View {
    
    @State private var shrinkRightSide = false
    @State private var downloadingProgress: Double = 0.0
    @State var isDownloaded = false
    @State private var isSheetPresented = false
    @Namespace var namespace
    
    var body: some View {
        
    }
}



struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
