//
//  TimerView.swift
//  CircularProgressViews
//
//  Created by Jessica Mallian on 3/7/23.
//

import SwiftUI

struct TimerView: View {
    let totalSeconds: Double
    @State var timeRemaining: Double = 0
    @State var timeElapsed: Double = 0
    @State var percent: Double = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerIsRunning: Bool
    
    init(totalSeconds: Double) {
        self.totalSeconds = totalSeconds
        self.timeRemaining = totalSeconds
        self.timerIsRunning = true
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    // TODO: if in landscape mode use height instead of width
                    CircularProgressViewWithBackground(progress: percent, color: .coolGray, lineWidth: 16, insideColor: .brightPink, width: geo.size.width)
                    Text("\(timeRemaining, specifier: "%.0f")")
                        .font(.system(size: 180, weight: .thin, design: .monospaced))
                        .foregroundColor(.mindaro)
                }
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                VStack {
                    HStack {
                        Button {
                            stopTimer()
                        } label: {
                            Text("stop")
                        }
                        .disabled(!timerIsRunning)
                        Button {
                            startTimer()
                        } label: {
                            Text("start")
                        }
                        .disabled(timerIsRunning)
                    }
                    Button {
                        restartTimer()
                    } label: {
                        Text("restart")
                    }

                }
                .font(.largeTitle)
            }
        }
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                timeElapsed += 1
                percent = timeElapsed/totalSeconds
            } else if timeRemaining == 0 {
                // TODO: play sound? dismiss view?
                stopTimer()
            }
        }
        .padding(40)
    }
    
    func stopTimer() {
        timer.upstream.connect().cancel()
        timerIsRunning = false
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        timerIsRunning = true
    }
    
    func restartTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        timerIsRunning = true
        timeRemaining = totalSeconds
        timeElapsed = 0
        percent = 0
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(totalSeconds: 60)
    }
}
