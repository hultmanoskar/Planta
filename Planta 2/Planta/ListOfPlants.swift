//
//  ListOfPlants.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-10.
//

import SwiftUI


struct ListOfPlants: View {
    
    var plants: [Plant]
    
    var body: some View {
       
        
        VStack(alignment: .leading) {
            Text("Få lite inspiration").font(.system(size: 20))
            Text("Hitta nya favorit plantor").font(.system(size: 20)).padding(.bottom)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 20)],spacing: 30, content: {
                ForEach(plants) { plant in
                    NavigationLink(destination: EachPlantView(plant: plant), label: {
                        PlantSheet(plant: plant)
                    })
                   
                }
            })

        }.padding()
    }
}


struct ListOfPlants_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ListOfPlants(plants: Plant.all)
        }
       
    }
}
