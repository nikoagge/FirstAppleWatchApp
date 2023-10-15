//
//  ElapsedTimeView.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 15/10/23.
//

import SwiftUI

struct ElapsedTimeView: View {
    var elapsedTime: TimeInterval = 0
    var showSubSeconds = true
    @State private var elapsedTimeFormatter = ElapsedTimeFormatter()
    
    var body: some View {
        Text(NSNumber(
            value: elapsedTime),
             formatter: elapsedTimeFormatter
        )
        .fontWeight(.semibold)
        .onChange(of: showSubSeconds) { elapsedTimeFormatter.showSubSeconds = $0 }
    }
}

struct ElapsedTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ElapsedTimeView()
    }
}
