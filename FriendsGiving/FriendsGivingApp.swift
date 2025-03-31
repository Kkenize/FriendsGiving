//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Zhejun Zhang on 3/24/25.
//

import SwiftUI
import SwiftData

@main
struct FriendsGivingApp: App {
    var body: some Scene {
        WindowGroup {
            GuestListView()
                .modelContainer(for: Guest.self)
        }
    }
    
    //will allow us to find where our simulator data is saved
    //runs when the file runs for the first time
    //prints out the location
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
