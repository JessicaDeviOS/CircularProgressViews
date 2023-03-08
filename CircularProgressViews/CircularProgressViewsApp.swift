//
//  CircularProgressViewsApp.swift
//  CircularProgressViews
//
//  Created by Jessica Mallian on 3/7/23.
//

import SwiftUI

@main
struct CircularProgressViewsApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            TimerView(totalSeconds: 60)
        }
    }
}
