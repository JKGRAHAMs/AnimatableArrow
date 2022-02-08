//
//  ContentView.swift
//  AnimatableArrow
//
//  Created by Joey Graham on 1/11/22.
//

import SwiftUI

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX * 1/4, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX * 1/4, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 3/4, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 3/4, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ContentView: View {
    @State private var lineThickness = 10
    
    var body: some View {
        NavigationView {
            VStack {
                Arrow()
                    .stroke(.black, style: StrokeStyle(lineWidth: CGFloat(lineThickness), lineCap: .round, lineJoin: .round))
                    .frame(width: 300, height: 500)
                    .onTapGesture {
                        withAnimation {
                            lineThickness = Int.random(in: 10...100)
                        }
                    }
            }
            .navigationTitle("Arrow")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
