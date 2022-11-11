//
//  UserDocument.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//

import Foundation
import FirebaseFirestoreSwift

struct UserDocument: Codable, Identifiable {
    @DocumentID var id: String?
  var myPlants: [PlantEntry]
    
}
struct PlantEntry: Codable, Identifiable {
    var id = UUID()
    var title: String
    var waterPerWeek: Int
    
}

