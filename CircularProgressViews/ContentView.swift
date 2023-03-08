//
//  ContentView.swift
//  CircularProgressViews
//
//  Created by Jessica Mallian on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: progress, progressBarColor: .brightPink)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 150, height: 150)
            
            Spacer()
            
            ZStack {
                CircularProgressView(progress: progress, shouldHaveRoundLineCap: false, progressBarColor: .feldgrau, lineWidth: 5, progressBackgroundOpacity: 0.35)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 150, height: 150)
            
            Spacer()
            
            ZStack {
                CircularProgressViewWithBackground(progress: progress, cappedProgressBar: true, color: .feldgrau, lineWidth: 10, opacity: 0.5, insideColor: .mindaro, width: 150)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }
            
            Spacer()
            
            HStack {
                Slider(value: $progress, in: 0...1)
                Button("Reset") {
                    resetProgress()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
    
    func resetProgress() {
        progress = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
