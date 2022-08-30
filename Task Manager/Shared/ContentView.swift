//
//  ContentView.swift
//  Shared
//
//  Created by Anish on 07/05/22.
//
 
import SwiftUI
import RiveRuntime
 
struct ContentView: View {
    @State private var isShowing = false

    init(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        NavigationView{
            ZStack {
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }
                ZStack{
                    glassmorph
                        .ignoresSafeArea()
                    background
                        .ignoresSafeArea()
                    Home()
                        .navigationBarTitle(getCurrentTime())
                        .navigationBarTitleDisplayMode(.inline)

                }
//                .cornerRadius(isShowing ? 20 : 10)
                .offset(x: isShowing ? UIScreen.main.bounds.width + 50 : 0, y: isShowing ? 50 : 0)
//                .scaleEffect(isShowing ? 0.8 : 1)
//                .blur(radius: isShowing ? 2 : 0)
                .navigationBarItems(leading: Button(action: {withAnimation(.spring()) {
                    isShowing.toggle()
                }
            
                }, label: { Image(systemName: "list.bullet")}))
                            .foregroundColor(.black)
            }
//            .onAppear {
//                isShowing = false
//            }
 
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func getCurrentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let theDate = "\(month)/\(day)/\(year)"
        return theDate
        
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 200)
            .background(
                Image("Spline")
                    .blur(radius: 100)
                    .offset(x: 200, y: 100)
        )
            
    }
    
    var glassmorph: some View {
        LinearGradient(
            colors: [Color("BG1"),Color("BG2")],
            startPoint: .top,
            endPoint: .bottom)
    }
    
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
