//
//  simpleView.swift
//  TotalityCorp
//
//  Created by KARAN D on 09/09/23.
//

import SwiftUI

struct simpleView: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 100,height: 100)
                        .cornerRadius(10)
                        .padding()
                    Spacer()
                }
                Spacer()
                Capsule()
                    .foregroundColor(.green)
                    .frame(width: 310,height: 70)
                    .padding()
            }
            .frame(height: 500)
            .background(Color.orange)
            .cornerRadius(20)
            .padding()
            
        }
    }
}

struct simpleView_Previews: PreviewProvider {
    static var previews: some View {
        simpleView()
    }
}
