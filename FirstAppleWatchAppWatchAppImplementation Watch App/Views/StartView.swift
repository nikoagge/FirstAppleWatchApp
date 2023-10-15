//
//  ContentView.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 14/10/23.
//

import SwiftUI
import HealthKit

struct StartView: View {
    var workoutTypes: [HKWorkoutActivityType] = [
        .cycling,
        .running,
        .functionalStrengthTraining,
        .walking
    ]
    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(
                workoutType.name,
                destination: Text(workoutType.name)
            ).padding(
                EdgeInsets(
                    top: 13,
                    leading: 4,
                    bottom: 13,
                    trailing: 4
                )
            )
        }
        .listStyle(.carousel)
        .navigationTitle("Workouts")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
    }
}

