//
//  StartPage.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI

struct StartPage: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    
    var body: some View {
        ZStack {
            Image("planta1.bg")
                .resizable()
                .overlay(LinearGradient(colors: [Color(hue: 1.0, saturation: 0.25, brightness: 1.0).opacity(0.50)], startPoint: .topLeading, endPoint: .bottomLeading))
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                Text("Planta").font(.system(size: 38, weight: .regular)).padding(.bottom)
                    Image(systemName: "leaf.fill").padding(.bottom)
                }
                VStack(alignment: .leading) {
                    Text("＂Att leva är inte nog; solsken, frihet och en liten blomma måste man ha!＂").font(.italic(.subheadline)())
                Text("- H.C. Andersen").font(.subheadline)
                }.padding().padding(.bottom).padding(.bottom)
                Spacer()
                Spacer()
                Spacer()
                VStack(alignment:.leading) {
                    NavigationLink(destination: LoginView(dbConnection: dbConnection),
                                   label: {
                        Text("Logga in").frame(width: 130, height: 55, alignment: .center).background(Color.white).cornerRadius(20).foregroundColor(.black).shadow(color: .black, radius: 20, x: 20, y: 20)
                            
                        
                    }).padding().transition(.opacity)
                    
                    
                }
                
            }.padding()
            
           
            
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage(dbConnection: DatabaseConnection())
    }
}
