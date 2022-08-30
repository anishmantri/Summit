//
//  SideMenuHeaderView.swift
//  Task Manager
//
//  Created by Anish on 7/14/22.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
                withAnimation(.spring()) {
                    isShowing.toggle()
                } 
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.white)
                    .padding(.trailing, 40)
                    .padding(.top, 20)
            })
            VStack(alignment: .leading) {
                Image("Spline")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .padding(.bottom, 16)
                    .blur(radius: 20)
                
                Text("")
                    .font(.system(size: 24, weight: .semibold))
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Text("").bold()
                        Text("")
                    }
                    HStack(spacing: 4){
                        Text("").bold()
                        Text("")
                    }
                    Spacer()
                }
                
                Spacer()
            }.padding()
        }
    }

}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}

