//
//  Sight.swift
//  SwiftDataStarterProject
//
//  Created by HubertMac on 19/03/2024.
//

import Foundation
import SwiftData

@Model
class Sight {
    var name: String
    var destination: Destination?
    
    init(name: String) {
        self.name = name
    }
}
