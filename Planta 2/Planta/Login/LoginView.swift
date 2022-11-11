//
//  LoginView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    @State var email = ""
    @State var password = ""
    @State var alert1 = false
    
    var body: some View {
        
        ZStack {
            Color(hue: 1.0, saturation: 0.25, brightness: 0.78).ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Välkommen tillbaka").font(.system(size: 30, weight: .regular)).padding(0.5)
                Text("Logga in till ditt konto").font(.subheadline)
                Image("planta.login").resizable().aspectRatio(contentMode: .fit).frame(width: 140, height: 140, alignment: .center).padding(4)
            
            
                HStack {
                    Image(systemName: "envelope.fill").frame(width: 5, height: 5).padding(7)
                    TextField("Email", text: $email).textFieldStyle(.roundedBorder).foregroundColor(.black).shadow(color: .black, radius: 4, x: 1, y: 1).frame(width: 222, height: 20, alignment: .center)
                }.padding(1)
                HStack {
                    Image(systemName: "lock.fill")
                    SecureField("Lösenord", text: $password).textFieldStyle(.roundedBorder).shadow(color: .black, radius: 4, x: 1, y: 1).frame(width: 222, height: 20, alignment: .center)
                }.padding()
                Spacer()
                
                VStack {
                    Button(action: {
                        
                        if email != "" && password != "" {
                            
                            dbConnection.LoginUser(email: email, password: password)
                        }
                        
                        if email == "" || password == "" {
                            alert1 = true
                        }
                        
                    }, label: {
                        Text("Logga in").frame(width: 245, height: 45, alignment: .center).background(.black).cornerRadius(15).foregroundColor(.white)
                            .alert(isPresented:$alert1) {
                                Alert(
                                    title: Text("Nåt gick fel"),
                                    message: Text("Lämna inga fält tomma"), dismissButton: .default(Text("Ok"))
                                    
                                )
                                
                            }
                    })
                    
                    NavigationLink(destination: { RegisterView(dbConnection: dbConnection)
                        
                    }, label: {
                        Text("Inget konto? Skapa ett idag").foregroundColor(.black)
                          
                    })
                }.padding(.bottom)
                
            
            }.navigationBarBackButtonHidden(true)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(dbConnection: DatabaseConnection())
    }
}
