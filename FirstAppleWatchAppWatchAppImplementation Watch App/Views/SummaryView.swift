//
//  SummaryView.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 15/10/23.
//

import SwiftUI
import HealthKit

struct SummaryView: View {
    @State private var durationFormatter: DateComponentsFormatter = {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [
            .hour,
            .minute,
            .second
        ]
        dateComponentsFormatter.zeroFormattingBehavior = .pad
        
        return dateComponentsFormatter
    }()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                SummaryMetricView(
                    title: "Total Time",
                    value: durationFormatter.string(from: 30 * 60 + 13) ?? ""
                ).accentColor(.red)
                
                SummaryMetricView(
                    title: "Total Distance",
                    value: Measurement(
                        value: 1300,
                        unit: UnitLength.meters
                    )
                    .formatted(.measurement(
                        width: .abbreviated,
                        usage: .road
                    ))
                ).accentColor(.green)
                
                SummaryMetricView(
                    title: "Total Energy",
                    value: Measurement(
                        value: 103,
                        unit: UnitEnergy.kilocalories
                    )
                    .formatted(.measurement(
                        width: .abbreviated,
                        usage: .workout,
                        numberFormatStyle: FloatingPointFormatStyle.number.precision(.fractionLength(0))
                    ))
                ).accentColor(.blue)
                
                SummaryMetricView(
                    title: "Avg. Heart Rate",
                    value: 130
                        .formatted(.number.precision(.fractionLength(0)))
                    + "bpm"
                ).accentColor(.gray)
                
                Text("Activity Rings")
                
                ActivityRingsView(healthStore: HKHealthStore())
                    .frame(
                        width: 58,
                        height: 58
                    )
                
                Button("Done") {}
            }
            .scenePadding()
        }
        .navigationTitle("Summary")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String
    
    var body: some View {
        Text(title)
        Text(value)
            .font(.system(
                .title2,
                design: .rounded
            )
                .lowercaseSmallCaps()
            )
            .foregroundColor(.accentColor)
        
        Divider()
    }
}
