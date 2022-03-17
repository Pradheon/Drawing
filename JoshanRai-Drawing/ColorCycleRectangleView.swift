//
//  ColorCycleRectangleView.swift
//  JoshanRai-Drawing
//
//  Created by Joshan Rai on 3/17/22.
//
//   Drawing: Wrap up

import SwiftUI

/// Challenge 3
struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCycleRectangleView: View {
    /// Challenge 3
    @State private var colorCycle = 0.0
    
    var body: some View {
        /// Challenge 3
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Text("Color Cycle: \(colorCycle)")
            Slider(value: $colorCycle)
                .padding()
        }
    }
}

struct ColorCycleRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCycleRectangleView()
    }
}
