//
//  ContactView.swift
//  Task Manager
//
//  Created by Anish Mantri on 7/17/22.
//

import SwiftUI
import RiveRuntime

struct ContactView: View {
    var body: some View {
        
        let websiteText = "Thank you for using Summit! If you have any questions or concerns, please contact us at contact@alpenglow.studio or visit our website [www.summitapp.tech](alpenglow.studio) for additional help."
        ZStack{
            glassmorph
                .ignoresSafeArea()
            background
                .ignoresSafeArea()
            VStack {
                Text("Contact Us")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical)
                Text(.init(websiteText))
                    .fixedSize(horizontal:false, vertical: true)
                    .font(.system(size: 16))
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                
                Spacer()

//
//                }
//                    Link("Privacy Policy", destination: URL(string: "https://alpenglow.studio/privacy.html")!)
//                    Link("Terms of Service", destination: URL(string: "https://alpenglow.studio/terms.html")!)

                VStack {
                    Link(destination: URL(string: "https://summitapp.tech")!, label: {
                        Text("Website                                                 ")
                            .fixedSize(horizontal:false, vertical: true)
                            .font(.system(size: 16))
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        
                    })
                    HStack {
                        Link(destination: URL(string: "https://docs.google.com/document/d/e/2PACX-1vSlOFEZ-8I9VANylQBocKiKPdcW0TZoCTgc0zBybMEBlmKfFcDy7LmH0X2UXs3HPHz5B6rQu_54wwQP/pub")!, label: {
                            Text("Privacy Policy")
                                .fixedSize(horizontal:false, vertical: true)
                                .font(.system(size: 16))
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(20)
                            
                        })

                        Link(destination: URL(string: "https://docs.google.com/document/d/e/2PACX-1vTvRTgUoVjNwUZXymMSaePVj86u9ynCVMke9zsV_bZ3dU3w_imtNgsKfe3oD8OYEDjraCIOp9Zd33ru/pub")!, label: {
                            Text("Terms of Service")
                                .fixedSize(horizontal:false, vertical: true)
                                .font(.system(size: 16))
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(20)
                            
                        })
                    }
                }

            }
            .padding()
            
        
            
            
        }
    }
    
    var glassmorph: some View {
        LinearGradient(
            colors: [Color("BG1"),Color("Green")],
            startPoint: .top,
            endPoint: .bottom)
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
    
    
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
