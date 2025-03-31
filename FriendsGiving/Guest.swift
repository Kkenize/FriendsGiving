//
//  Guest.swift
//  FriendsGiving
//
//  Created by Zhejun Zhang on 3/24/25.
//

import Foundation
import SwiftData

@Model
class Guest {
    var name: String
    var item: String
    var notes: String
    
    init(name: String, item: String, notes: String) {
        self.name = name
        self.item = item
        self.notes = notes
    }
    
    convenience init() {
        self.init(name: "", item: "", notes: "")
    }
}

extension Guest {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Guest.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            // Add mock data
            container.mainContext.insert(Guest(name: "Snoop", item: "Brownies", notes: ""))
            container.mainContext.insert(Guest(name: "Travis Kelce", item: "Ribs", notes: ""))
            container.mainContext.insert(Guest(name: "Taylor Swift", item: "Cheese Steaks", notes: ""))
            container.mainContext.insert(Guest(name: "Beyoncé", item: "Taco Salad", notes: ""))
        }
        
        
        return container
    }
}
