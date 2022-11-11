//
//  HomeView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeView: View {
    @ObservedObject var dbConnection: DatabaseConnection
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("\(Date().formatted(date:.complete , time: .omitted))").font(.subheadline).padding(.top).padding(.leading)
                    Image(systemName: "person.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 30, alignment: .center).padding(.leading)
                }.frame(width: UIScreen.main.bounds.width, height: 140, alignment: .leading).background(Color(hue: 1.0, saturation: 0.25, brightness: 0.78).opacity(0.7)).cornerRadius(30).ignoresSafeArea()
                
                   VStack {
                       Text("Mina plantor").font(.title).padding(.leading)
                       

                       if let userDocument = dbConnection.userDocument {
                           
                                                         
                           ScrollView {
                           LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 10)],spacing: 30, content: {
                               ForEach(userDocument.myPlants) { plant in
                                   VStack {
                                       
                                       Image("planta.register").resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 80, alignment: .center)

                                           Text(plant.title).font(.title3)
                                           Text("Vattnas  \(String(plant.waterPerWeek)) per vecka")

//                                       Button(action: {
//                                           // Delete plant
//                                       }, label: {
//                                           Image(systemName: "x.circle").resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 30, alignment: .center).foregroundColor(.black)
//                                       })
                                      

                                   }.frame(width: 170, height: 170, alignment: .center).background(Color(hue: 1.0, saturation: 0.25, brightness: 0.78).opacity(0.2)).cornerRadius(20)

                                  
                               }
                           })
                           }
                          
                           
                       }
                      
                }
                
                Spacer()
                
               
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            
           
           
        }
    }
}

struct myPlant: View {
    
    var body: some View {
        
        Text("hej")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(dbConnection: DatabaseConnection())
    }
}
