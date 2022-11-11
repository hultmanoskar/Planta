//
//  ContentView.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    
    @StateObject var dbConnection = DatabaseConnection()
    
    var body: some View {
//        TabBar()
        if dbConnection.userLoggedIn {
            NavigationView {
            TabBar(dbConnection: dbConnection)
            }

        } else {
            NavigationView(content: {
            StartPage(dbConnection: dbConnection)

        })
                           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
