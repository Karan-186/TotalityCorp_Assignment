//
//  homeButtonView.swift
//  TotalityCorp
//
//  Created by KARAN D on 11/09/23.
//

import SwiftUI

struct homeButtonView: View {
    
    @State private var shrinkRightSide = false
    @State private var downloadingProgress: Double = 0.0
    @State var isDownloaded = false
    @State private var isSheetPresented = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                        shrinkRightSide = true
                        
                        // Simulate a downloading effect for demonstration
                        if shrinkRightSide {
                            downloadingProgress = 0.0
                            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                withAnimation {
                                    downloadingProgress += 10.0
                                }
                                if downloadingProgress >= 30.0 {
                                    isDownloaded = true
                                    timer.invalidate()
                                    withAnimation {
                                        shrinkRightSide = false
                                    }
                                }
                            }
                        }
                    }
                }) {
                    //Change the button dynamics based on the download progress
                    if(!isDownloaded){
                        HStack{
                            
                            ZStack(alignment: .center) {
                                shrinkableCapsule(shrinkRightSide: shrinkRightSide)
                                    .frame(width: 200, height: 75)
                                    .foregroundColor(.green)
                                    .opacity(shrinkRightSide ? 0.5 : 1)
                                
                                if downloadingProgress == 0.0 {
                                    VStack{
                                        Text("DOWNLOAD")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                        Text("30 MB")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding(.horizontal,50)
                                }else if(downloadingProgress > 0 && downloadingProgress < 30) {
                                    VStack{
                                        Text("Downloading...")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                        Text(String(format: "%.0f MB / 30 MB", downloadingProgress))
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding(.horizontal,50)
                                }
                            }
                            if shrinkRightSide {
                                Image(systemName: !isDownloaded ? "xmark" : "checkmark")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Circle().foregroundColor(.yellow))
                            }
                        }
                    }else{
                        if(!isSheetPresented){
                            Button {
                                isSheetPresented.toggle()
                            } label: {
                                
                                ZStack(alignment: .center) {
                                    customCapsule(customHeight: 75, customWidth: 350,customColor: .blue)
                                    VStack{
                                        Text("PLAY")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                }
                                .matchedGeometryEffect(id: "PLAY", in: namespace)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                sheetView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.automatic)
            }
        }
    }
}


struct shrinkableCapsule: View {
    var shrinkRightSide: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let midY = height / 2
                let shrinkFactor: CGFloat = shrinkRightSide ? 0.79 : 1.0 // Adjust the factor as needed
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width * shrinkFactor, y: 0))
                path.addArc(center: CGPoint(x: width * shrinkFactor, y: midY), radius: midY, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: height))
                path.addArc(center: CGPoint(x: 0, y: midY), radius: midY, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
            }
            .fill()
        }
    }
}

struct homeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        homeButtonView()
    }
}
