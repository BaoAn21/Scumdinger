//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Trần Ân on 24/6/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: $scrums)
        }
    }
}
