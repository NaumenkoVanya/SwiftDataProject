//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ваня Науменко on 14.03.24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
//    @Query(sort: \User.name) var users: [User]
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") && user.city == "Minsk"},
           sort: \User.name) var users: [User]
    
//    @Query(filter: #Predicate<User> { user in
//        if user.name.localizedStandardContains("R") {
//            if user.city == "London" {
//                return true
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
//    }, sort: \User.name) var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samplews", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ivan Norca", city: "Minsk", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let example = User(name: "", city: "", joinDate: .now)

        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
