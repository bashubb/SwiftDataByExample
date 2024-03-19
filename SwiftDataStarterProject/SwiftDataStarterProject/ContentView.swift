//
//  ContentView.swift
//  SwiftDataStarterProject
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    //challenge 2
    @State private var sortOrder = [
        SortDescriptor(\Destination.name),
        SortDescriptor(\Destination.date)
    ]
    @State private var searchText = ""
    
    @State private var minimumDate = Date.distantPast
    let currentDate = Date.now
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText, minimumDate: minimumDate)
                .searchable(text: $searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self){ destination in
                    EditDestinationView(destination: destination)
                }
                .toolbar{
                    Button("Add Destionation", systemImage: "plus", action: addDestination)
                    
                    //challenge 2
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag([
                                    SortDescriptor(\Destination.name),
                                    SortDescriptor(\Destination.date)
                                ])
                            
                            Text("Priority")
                                .tag([
                                    SortDescriptor(\Destination.priority, order: .reverse),
                                    SortDescriptor(\Destination.name)
                                ])
                            
                            Text("Date")
                                .tag([
                                    SortDescriptor(\Destination.date),
                                    SortDescriptor(\Destination.name)
                                ])
                        }
                        .pickerStyle(.inline)
                        
                        Picker("Fillter", selection: $minimumDate) {
                            Text("Show all destinations")
                                .tag(Date.distantPast)
                            
                            Text("Show upcoming destination")
                                .tag(currentDate)
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
    
}

#Preview {
    ContentView()
}
