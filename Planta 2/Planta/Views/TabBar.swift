//
//  TabBar.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct TabBar: View {
    
    @ObservedObject var dbConnection: DatabaseConnection
    var body: some View {
        
        TabView {
            BrowsePlantsView().tabItem {
                Label("Plantor", systemImage: "leaf.fill")
           
            }
            AddPlantView(dbConnection: dbConnection).tabItem {
                Label("Lägg till", systemImage: "plus")
            }
            HomeView(dbConnection: dbConnection).tabItem {
                Label("Hem", systemImage: "person.fill")
            }
            ExtraView(dbConnection: dbConnection).tabItem {
                Label("Läs mer", systemImage: "book.fill")
            }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(dbConnection: DatabaseConnection())
    }
}
