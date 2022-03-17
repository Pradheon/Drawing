//
//  ArrowView.swift
//  JoshanRai-Drawing
//
//  Created by Joshan Rai on 3/17/22.
//
//   Drawing: Wrap up

import SwiftUI

/// Challenge 1 & 2
struct Arrow: Shape {
    var lineWidth: Double
    
    var animatableData: Double {
        get { lineWidth }
        set { lineWidth = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
}

struct ArrowView: View {
    /// Challenge 1 & 2
    @State private var lineWidth = 10.0
    
    var body: some View {
        /// Challenge 1
        VStack {
            Arrow(lineWidth: lineWidth)
                .stroke(.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
            
            /// Challenge 2
            Text("Line Width: \(Int(lineWidth))")
            Slider(value: $lineWidth, in: 1...100, step: 1)
                .padding([.horizontal, .bottom])
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
