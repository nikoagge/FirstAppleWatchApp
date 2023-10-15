//
//  Formatters.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 15/10/23.
//

import Foundation

class ElapsedTimeFormatter: Formatter {
    let dateComponentsFormatter: DateComponentsFormatter = {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [
            .minute,
            .second
        ]
        dateComponentsFormatter.zeroFormattingBehavior = .pad
        
        return dateComponentsFormatter
    }()
    var showSubSeconds = true
    
    override func string(for obj: Any?) -> String? {
        guard
            let timeInterval = obj as? TimeInterval,
            let formattedString = dateComponentsFormatter.string(from: timeInterval)
        else { return nil }
        
        if showSubSeconds {
            let hundreths = Int((timeInterval.truncatingRemainder(dividingBy: 1)) * 100)
            let decimalSeparator = Locale.current.decimalSeparator ?? ","
            
            return String(
                format: "%@%@%0.2d",
                formattedString,
                decimalSeparator,
                hundreths
            )
        }
        
        return formattedString
    }
}
