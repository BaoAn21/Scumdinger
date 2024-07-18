//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Trần Ân on 29/6/24.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                        
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
        }
        
    }
}

#Preview {
    ScrumView(scrums: .constant(DailyScrum.sampleData))
}
