//
//  SessionPagingView.swift
//  FirstAppleWatchAppWatchAppImplementation Watch App
//
//  Created by Nikos Aggelidis on 14/10/23.
//

import SwiftUI
import WatchKit

struct SessionPagingView: View {
    @State private var selectedTab: SelectedTab = .metrics
    
    enum SelectedTab  {
        case controls, metrics, nowPlaying
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ControlsView().tag(SelectedTab.controls)
            MetricsView().tag(SelectedTab.metrics)
            NowPlayingView().tag(SelectedTab.nowPlaying)
        }
    }
}

struct SessionPagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView()
    }
}
