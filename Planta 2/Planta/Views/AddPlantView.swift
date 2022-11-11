//
//  AddPlantView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct AddPlantView: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    @State var title = ""
    @State var waterPerWeek = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Plantans namn")
                TextField("Namn:", text: $title).frame(width: 220, height: 30, alignment: .center)
                Rectangle().frame(width: UIScreen.main.bounds.width * 0.6, height: 2, alignment: .center).offset( y: -12)
                
                Text("Vattning / Vecka")
                TextField("Skriv en siffra:", value: $waterPerWeek, formatter: NumberFormatter()).frame(width: 220, height: 30, alignment: .center).keyboardType(.numberPad)
                Rectangle().frame(width: UIScreen.main.bounds.width * 0.6, height: 2, alignment: .center).offset(y: -12)
                
                Spacer()
                
                Button(action: {
                    
//                    if title == "" {
//
//                        
//                        show
//                    }
                    
                    dbConnection.addItemToDb(plant: PlantEntry(title: title, waterPerWeek: waterPerWeek))
                    
                }, label: {
                    Text("Lägg till").frame(width: 120, height: 40, alignment: .center).background(.black).cornerRadius(20).foregroundColor(.white)
                }).padding()
                
                    
                
            
            }.navigationTitle("Lägg till planta")
           
            
            
        }
    }
}

struct AddPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantView(dbConnection: DatabaseConnection())
    }
}
