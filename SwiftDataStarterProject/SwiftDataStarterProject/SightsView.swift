//
//  SightsView.swift
//  SwiftDataStarterProject
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI

struct SightsView: View {
    @Query(sort: \Sight.name) var sights: [Sight]
    var body: some View {
        NavigationStack {
            List(sights) { sight in
                NavigationLink(value: sight.destination) {
                    Text(sight.name)
                }
            }
            .navigationTitle("Sights")
            .navigationDestination(for: Destination.self) { destination in
                EditDestinationView(destination: destination)
            }
        }
    }
}

#Preview {
    SightsView()
}
