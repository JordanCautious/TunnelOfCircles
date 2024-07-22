//
//  ContentView.swift
//  TunnelOfCircles
//
//  Created by Jordan Haynes on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.cyan,.blue]
    @State private var depth = 0.0
    
    let minDiameter = 50.0
    let diameterChange = 70.0
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Tunnel of Circles")
                .font(.largeTitle)
                .padding()
            ZStack {
                ForEach(0..<4) { index in
                    Circle()
                        .stroke(lineWidth: 30)
                        .foregroundStyle(colors[index % 2])
                        .frame(height: minDiameter + diameterChange * Double(index))
                        .padding3D(.back, depth)
                }
            }
            .padding(.bottom, 30)
            Grid {
                GridRow {
                    Text("Depth")
                    Slider(value: $depth, in: 0...50) {
                        Text("Depth")
                    }
                }
                GridRow {
                    Text("Colors")
                    HStack {
                        ColorPicker("Color", selection: $colors[0])
                        ColorPicker("Color", selection: $colors[1])
                        Spacer()
                    }
                    .labelsHidden()
                }
            }
            .padding(30)
            .background(.thickMaterial)
            .frame(minWidth: 320)
        }
        .frame(minHeight: 560)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
