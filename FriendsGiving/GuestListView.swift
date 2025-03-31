//
//  GuestListView.swift
//  FriendsGiving
//
//  Created by Zhejun Zhang on 3/24/25.
//

import SwiftUI
import SwiftData

struct GuestListView: View {
    @Query var guests: [Guest]
    @State private var sheetIsPersented = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(guests) { guest in
                    NavigationLink {
                        GuestDetailView(guest: guest)
                    } label: {
                        Text(guest.name)
                            .font(.title)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Friends:")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPersented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $sheetIsPersented) {
            NavigationStack {
                GuestDetailView(guest: Guest())
            }
        }
    }
}

#Preview {
    GuestListView()
        .modelContainer(Guest.preview)
}
