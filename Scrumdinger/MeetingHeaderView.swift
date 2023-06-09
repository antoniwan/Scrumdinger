//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Antonio Rodriguez on 3/22/23.
//

import SwiftUI

struct MeetingHeaderView: View {
    let theme: Theme
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }.accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesRemaining) minutes")
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(theme: .buttercup,secondsElapsed: 39, secondsRemaining: 180)
            .previewLayout(.sizeThatFits)
    }
}
