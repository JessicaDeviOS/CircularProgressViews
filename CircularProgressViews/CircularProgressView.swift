//
//  CircularProgressView.swift
//  CircularProgressViews
//
//  Created by Jessica Mallian on 3/7/23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let shouldHaveRoundLineCap: Bool
    let progressBarColor: Color
    let lineWidth: CGFloat
    let progressBackgroundOpacity: Double
    
    init(progress: Double, shouldHaveRoundLineCap: Bool = true, progressBarColor: Color, lineWidth: CGFloat = 30.0, progressBackgroundOpacity: Double = 0.5) {
        self.progress = progress
        self.shouldHaveRoundLineCap = shouldHaveRoundLineCap
        self.progressBarColor = progressBarColor
        self.lineWidth = lineWidth
        self.progressBackgroundOpacity = progressBackgroundOpacity
    }
    
    var body: some View {
        ZStack {
            // background circle
            Circle()
                .stroke(progressBarColor.opacity(progressBackgroundOpacity), lineWidth: lineWidth)
            // progress circle
            Circle()
                .trim(from: 0, to: progress) // determines the progress to show
                .stroke(progressBarColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: shouldHaveRoundLineCap ? .round : .square))
                .rotationEffect(.degrees(-90)) // so the progress bar starts from the top instead of the right side
                .animation(.easeOut, value: progress)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.78, progressBarColor: .green)
            .padding(30)
    }
}
