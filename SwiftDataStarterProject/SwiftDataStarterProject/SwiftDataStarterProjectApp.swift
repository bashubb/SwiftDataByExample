//
//  SwiftDataStarterProjectApp.swift
//  SwiftDataStarterProject
//
//  Created by HubertMac on 19/03/2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataStarterProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Destinations", systemImage: "map")
                    }
                
                SightsView()
                    .tabItem{
                        Label("Sights", systemImage: "mappin.and.ellipse")
                    }
                
            }
        }
        .modelContainer(for: Destination.self)
    }
}
