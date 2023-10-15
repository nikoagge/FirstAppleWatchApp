//
//  MetricsView.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 15/10/23.
//

import SwiftUI
import HealthKit

struct MetricsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("04.40.13")
                .foregroundColor(.yellow)
                .fontWeight(.semibold)
            
            Text(Measurement(
                value: 58,
                unit: UnitEnergy.kilocalories
            ).formatted(.measurement(
                width: .abbreviated,
                usage: .workout,
                numberFormatStyle: FloatingPointFormatStyle.number.precision(.fractionLength(0))
            )))
            
            Text(
                103.formatted(.number.precision(.fractionLength(0))) + "bpm"
            )
            
            Text(Measurement(
                value: 220,
                unit: UnitLength.meters // Convert later ft to meters
            ).formatted(.measurement(
                width: .abbreviated,
                usage: .road
            )))
        }
        .font(.system(
            .title,
            design:.rounded
        )
            .monospacedDigit()
            .smallCaps()
        )
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .ignoresSafeArea(edges: .bottom)
        .scenePadding()
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView()
    }
}
