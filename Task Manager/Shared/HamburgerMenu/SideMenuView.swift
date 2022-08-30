//
//  SideMenuView.swift
//  Task Manager
//
//  Created by Anish on 7/14/22.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Header
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                    .foregroundColor(.white)
                
                // Option View
                    .navigationTitle("Menu")
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    NavigationLink(
                        destination: ContactView(),
                        label: { SideMenuOptionView(viewModel: option)
                        })
                }
                
                Spacer()
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
