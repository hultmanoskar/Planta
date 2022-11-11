//
//  ExtraView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-11.
//

import SwiftUI

struct ExtraView: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    
    var body: some View {
       
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Image("odling").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 200, alignment: .center).padding(.leading)
                    Text("Lär dig mer om odling").font(.title2).padding(.leading)
                        Text("Med hjälp av den här skolan blir det lätt att välja bästa möjliga jord till dina...").onTapGesture {
                        UIApplication.shared.open(URL(string: "https://www.plantagen.se")!, options: [:])
                }
                    
                    
                }.frame(width: 300, height: 300, alignment: .center).background(.gray.opacity(0.18)).cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Image("mossa").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 200, alignment: .center).padding(.leading)
                    Text("Gör din egen mosskrans").font(.title2).padding(.leading)
                        Text("En mosskrans är en säker vinnare om du vill ha en krans som passar till höst, jul och nyår! Gör....").onTapGesture {
                            UIApplication.shared.open(URL(string: "https://www.plantagen.se/gor-din-egen-mosskrans.html")!, options: [:])
                            
                }
                    
                }.frame(width: 300, height: 300, alignment: .center).background(.gray.opacity(0.18)).cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Image("fågel").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 200, alignment: .center).padding(.leading)
                    Text("Fågelmatning – så lyckas du").font(.title2)
                        Text("Varför inte låta en del av naturens vardagsdramatik utspela sig i din trädgård - bjud skogens alla småfåglar på mat! Det är fascinerande....").onTapGesture {
                        UIApplication.shared.open(URL(string: "https://www.plantagen.se/fagelmatning-sa-lyckas-du.html")!, options: [:])
                }
                    
                }.frame(width: 300, height: 300, alignment: .center).background(.gray.opacity(0.18)).cornerRadius(20).padding()
                
                VStack(alignment: .leading) {
                    Image("växter").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 200, alignment: .center).padding(.leading)
                    Text("Gröna växter med ovanliga blad").font(.title2)
                        Text("Gröna växter ligger rätt i tiden och de får numera gärna finnas i hela bostaden. Något alldeles extra är de lite ovanligare växterna med speciella...").onTapGesture {
                        UIApplication.shared.open(URL(string: "https://www.plantagen.se/grona-vaxter-med-ovanliga-blad.html")!, options: [:])
                }
                    
                }.frame(width: 300, height: 300, alignment: .center).background(.gray.opacity(0.18)).cornerRadius(20)
                
            }
        }.navigationTitle("Läs mer")
    }
}

struct ExtraView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraView(dbConnection: DatabaseConnection())
    }
}
