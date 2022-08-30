//
//  SplashView.swift
//  Task Manager
//
//  Created by Anish Mantri on 7/9/22.
//
//TO USE THIS, CHANGE TO SPLASHVIEW IN TASK MANAGER SECTION. SHOULD BE ON CONTENT OR MAIN VIEW AS OF NOW
 
import SwiftUI
 
struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
        ZStack {
            Color("BG2")
                .ignoresSafeArea()
            VStack{
                VStack{
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280.0, height: 280.0)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
 
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
        
    }
 
 
}
 
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
}
