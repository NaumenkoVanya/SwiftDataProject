//
//  User.swift
//  SwiftDataProject
//
//  Created by Ваня Науменко on 14.03.24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var jods: [Job]? = [Job]()
    
    var unwrappedJobs: [Job] {
        jods ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
