//
//  GuestDetailView.swift
//  FriendsGiving
//
//  Created by Zhejun Zhang on 3/31/25.
//

import SwiftUI
import SwiftData

struct GuestDetailView: View {
    @State var guest: Guest
    @State private var name = ""
    @State private var item = ""
    @State private var notes = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Name:")
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(Color.gray, lineWidth: 2)
                }
                .padding(.bottom)
            
            Text("Is bringing:")
            TextField("bringing item", text: $item)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(Color.gray, lineWidth: 2)
                }
                .padding(.bottom)
            
            Text("Notes:")
            TextField("notes", text: $notes)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(Color.gray, lineWidth: 2)
                }
                .padding(.bottom)
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            name = guest.name
            item = guest.item
            notes = guest.notes
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guest.name = name
                    guest.item = item
                    guest.notes = notes
                    modelContext.insert(guest)
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save did not work.")
                        return
                    }
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        GuestDetailView(guest: Guest(name: "Lady Gaga", item: "Pokerface Punch", notes: "Ask her to sing!"))
            .modelContainer(for: Guest.self, inMemory: true)
    }
}
