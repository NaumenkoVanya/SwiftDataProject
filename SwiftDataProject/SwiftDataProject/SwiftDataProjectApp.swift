//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ваня Науменко on 14.03.24.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
