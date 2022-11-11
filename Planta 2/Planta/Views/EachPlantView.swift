//
//  EachPlantView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-10.
//

import SwiftUI


struct EachPlantView: View {
    
    var plant: Plant
    var body: some View {
        ScrollView {
            VStack {
            AsyncImage(url: URL(string: plant.image)) {
                image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                VStack {
                    Image(systemName: "photo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 80, alignment: .center)
                    Text("Laddar...").font(.title2)
                }
               
            }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
            
                VStack {
                Rectangle().frame(width: UIScreen.main.bounds.width, height: 3, alignment: .center)
                Text(plant.name).font(.title2)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(plant.description)
                    HStack {
                        Text("Plats:")
                        Text(plant.location)
                       
                    }
                    Text("Finns att köpa på Plantagen")
                    Text("Besök Plantagen").foregroundColor(.blue)
                            .onTapGesture {
                                    UIApplication.shared.open(URL(string: "https://www.plantagen.se")!, options: [:])
                            }
                }.padding()
            }
        }.ignoresSafeArea(.container, edges: .top).background()
    }
}

struct EachPlantView_Previews: PreviewProvider {
    static var previews: some View {
        EachPlantView(plant: Plant.all[1])
    }
}
