//
//  CircularProgressViewWithBackground.swift
//  CircularProgressViews
//
//  Created by Jessica Mallian on 3/7/23.
//

import SwiftUI

struct CircularProgressViewWithBackground: View {
    let progress: Double
    let cappedProgressBar: Bool
    let color: Color
    let lineWidth: CGFloat
    let opacity: Double
    let insideColor: Color
    let width: CGFloat
    
    init(progress: Double, cappedProgressBar: Bool = true, color: Color, lineWidth: CGFloat = 10.0, opacity: Double = 0.5, insideColor: Color, width: CGFloat = 50.0) {
        self.progress = progress
        self.cappedProgressBar = cappedProgressBar
        self.color = color
        self.lineWidth = lineWidth
        self.opacity = opacity
        self.insideColor = insideColor
        self.width = width
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(insideColor)
                .frame(width: width, height: width)
            Circle()
                .stroke(color.opacity(opacity), style: StrokeStyle(lineWidth: lineWidth))
                .frame(width: width + lineWidth, height: width + lineWidth)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: cappedProgressBar ? .round : .square))
                .frame(width: width + lineWidth, height: width + lineWidth)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}

struct CircularProgressViewWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressViewWithBackground(progress: 0.25, color: .green, insideColor: .gray)
    }
}
