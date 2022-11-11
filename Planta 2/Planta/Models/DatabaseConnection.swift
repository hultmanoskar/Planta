//
//  DatabaseConnection.swift
//  Planta
//
//  Created by Oskar Hultman on 2022-11-09.
//


import Foundation
import Firebase
import FirebaseFirestoreSwift

class DatabaseConnection: ObservableObject {
    
    private var db = Firestore.firestore()
    
    @Published var userDocument: UserDocument?
    @Published var userCurrent: User?
    @Published var userLoggedIn = false

    
    var userDocumentListener: ListenerRegistration?
    
    init() {

       

        do {
            try Auth.auth().signOut()
        } catch  {
            print("Error")
        }

        
        Auth.auth().addStateDidChangeListener {
            (auth, user) in
            
            if let user = user {
                // Logged In
                self.userLoggedIn = true
                self.userCurrent = user
                self.listenToDatabase()
                
            } else {
                // Logged Out
                self.userLoggedIn = false
                self.userCurrent = nil
                self.stopListeningToDb()
                
                
            }
        }
    }
    
//    let userDataRef: CollectionReference?
//
//    init() {
//        userDataRef = self.db.collection("userData")
//    }
//
    
    func logOutUser() {
        
        
        do {
            try Auth.auth().signOut()
        } catch  {
            print("Error")
        }
    }
    
    func LoginUser(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (authDataResult, error) in
            
            if let error = error {
                print("Error loggin in:  \(error)")
                
            }
            
        }
    }
    
    func RegisterUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) {
            (authDataResult, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let authDataResult = authDataResult {
                
                let newUserDocument = UserDocument(id: authDataResult.user.uid, myPlants: [])
                
                do {
                    _ = try self.db.collection("userData").document(authDataResult.user.uid).setData(from: newUserDocument)
                    
                } catch {
                    print("error")
                }
            }
        }
    }
    
//    func deleteData() {
//
//        if let userCurrent = userCurrent {
//
//            db.collection("userData").document(userCurrent.uid).updateData([
//                "myPlants": FieldValue.delete(),
//    ]) { err in
//        if let err = err {
//            print("Error updating document: \(err)")
//        } else {
//            print("Document successfully updated")
//        }
//    }
//        }
//    }

    func addItemToDb(plant: PlantEntry) {

        if let userCurrent = userCurrent {

            do {
                try db.collection("userData").document(userCurrent.uid).updateData(["myPlants": FieldValue.arrayUnion([Firestore.Encoder().encode(plant)])])
            } catch {
                print("Error \(error)")
            }

        }
    }
    
  
    
    func stopListeningToDb() {
        
        if let userDocumentListener = userDocumentListener {
            userDocumentListener.remove()
        }
    }
    
    
    func listenToDatabase() {

            if let userCurrent = userCurrent {
            userDocumentListener = self.db.collection("userData").document(userCurrent.uid).addSnapshotListener {
                snapshot, error in
                
                if let error = error {
                    print("Error occured: \(error)")
                    return
                }
                
                guard let snapshot = snapshot else {
                    return
                }
                
                let result = Result {
                    try snapshot.data(as: UserDocument.self)
                }
                
                switch result {
                case .success(let userData):
                    self.userDocument = userData
                    break
                case .failure(let error):
                    print("Something went wrong retrieving data: \(error)")
                }
            }
        }
        
}
    
}
