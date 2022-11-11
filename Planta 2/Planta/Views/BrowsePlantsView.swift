//
//  BrowsePlantsView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI


struct BrowsePlantsView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                ListOfPlants(plants: Plant.all)
            }.navigationTitle("Plantor")
            
        }
    }
}

struct BrowsePlantsView_Previews: PreviewProvider {
    static var previews: some View {
        BrowsePlantsView()
    }
}
