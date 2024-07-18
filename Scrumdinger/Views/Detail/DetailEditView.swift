//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Trần Ân on 29/6/24.
//

import SwiftUI

struct DetailEditView: View {
    
    @State private var newAttendeeName = ""
    @Binding var scrum: DailyScrum
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30,step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                ThemePicker(selection: $scrum.theme)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            if !newAttendeeName.isEmpty {
                                scrum.attendees.append(DailyScrum.Attendee(name: newAttendeeName))
                                newAttendeeName = ""
                            }
                            
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
