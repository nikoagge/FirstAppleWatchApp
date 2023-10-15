//
//  HKWorkoutActivityType+Extension.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 14/10/23.
//

import Foundation
import HealthKit

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }
    
    var name: String {
        switch self {
        case .running: return "Run"
        case .cycling: return "Bike"
        case .walking: return "Walk"
        case .functionalStrengthTraining: return "Functional"
        default: return ""
        }
    }
}
