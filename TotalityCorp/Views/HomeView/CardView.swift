//
//  CardView.swift
//  TotalityCorp
//
//  Created by KARAN D on 09/09/23.
//

import SwiftUI

struct CardView: View {
    
    @Namespace var namespace
    
    @State var isStackPressed = false
    @State private var xOffset: CGFloat = UIScreen.main.bounds.width // Initial X offset
    
    @State var isDownloadButtonPressed = false
    
    
    
    var body: some View {
        
        //Condition to open second screen on top of first screen using animation effects
        if(!isStackPressed){
            ScrollView{
                VStack{
                    HStack{
                        customRectangle(customHeight: 100,customWidth: 100,customCornerRadius: 10, customColor: .yellow)
                            .matchedGeometryEffect(id: "Appicon", in: namespace)
                            .padding()
                        Spacer()
                    }
                    Spacer()
                    Capsule()
                        .matchedGeometryEffect(id: "Download", in: namespace)
                        .foregroundColor(.green)
                        .frame(width: 310,height: 70)
                        .padding()
                }
                .frame(height: 450)
                .background(Color.orange)
                .cornerRadius(20)
                .padding()
                .onTapGesture {
                    withAnimation {
                        isStackPressed.toggle()
                    }
                }
            }
        }else{
            VStack{
                HStack(alignment: .top){
                    customRectangle(customHeight: 100,customWidth: 100,customCornerRadius: 10, customColor: .yellow)
                        .matchedGeometryEffect(id: "Appicon", in: namespace)

                    VStack(alignment: .leading){
                        Text("CANDY")
                        Text("BUST")
                    }
                    .font(.title3)
                    .fontDesign(.serif)
                    Spacer()
                    Image(systemName: "xmark")
                        .padding(.vertical)
                        .onTapGesture {
                            withAnimation {
                                isStackPressed.toggle()
                                xOffset = UIScreen.main.bounds.width
                            }
                        }
                }
                .padding(.vertical,2)
                
                VStack(alignment: .leading){
                    Text("What is Lorem Ipsum?Lorem Ipsum is simply")
                    Text("dummy text of the printing and typesetting")
                }
                .fontDesign(.serif)
                
                VStack(alignment: .center){
                    Text("READ MORE")
                }
                .foregroundColor(.green)
                .padding(.vertical,2)
                
                withAnimation {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 10) {
                            ForEach(1..<10) { index in
                                customRectangle(customHeight: 300,customWidth: 200, customColor: .gray)
                            }
                        }
                    }
                    .padding()
                    .transition(.move(edge: .leading)) // Animate the ScrollView from right to left
                    .offset(x: xOffset) // Apply the X offset for animation
                }
                Button {
                    withAnimation {
                        isDownloadButtonPressed.toggle()
                    }
                } label: {
                    homeButtonView()
                }
            }
            .onAppear {
                // Animate the ScrollView in from the right
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        xOffset = 0
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
