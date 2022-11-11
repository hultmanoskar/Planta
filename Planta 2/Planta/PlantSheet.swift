//
//  PlantSheet.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI


struct PlantSheet: View {
    
    var plant: Plant
    
    var body: some View {
        VStack(alignment: .leading) {
        AsyncImage(url: URL(string: plant.image)) { image in
            VStack(alignment: .leading) {
                image.resizable()
                
                Text(plant.name).font(.system(size: 18))
                
                HStack {
                    Text("Plats:").font(.system(size: 14))
                    Text(plant.location).font(.system(size: 14))
                }
                
            
                
                
            }.frame(maxWidth: 180).padding()
            
        } placeholder: {
            VStack {
                Spacer()
                Image(systemName: "photo").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 30, alignment: .center)
                Text("Image not found").font(.subheadline)
                Spacer()
                Text(plant.name).font(.system(size: 18))
            }.padding()
        
        }
        }.frame(width: 150, height: 205, alignment: .center).background(.white.opacity(0.99)).foregroundColor(.black).cornerRadius(20).shadow(color: .black, radius: 5, x: 0, y: 0)
    }
}

struct PlantSheet_Previews: PreviewProvider {
    static var previews: some View {
        PlantSheet(plant: Plant.all[1])
    }
}
