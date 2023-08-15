//
//  ContentView.swift
//  Visual_03
//
//  Created by Wonil Lee on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var timer: Timer?
    @State var rotationTrigger = false
    @State var revolutionTrigger = false
    @State var tensionTrigger = false
    @State var hitButtonIsAvailable = true
    
    var initialOffsetArray: [CGPoint] = []
    var normalVectorArray: [CGPoint] = []
    var initialDegreeArray: [CGFloat] = []
    var colorArray: [Color] = []
    
    init() {
        for _ in 0..<DesignSystem.stickCount {
            let theta = Double.random(in: 0..<(2.0 * Double.pi))
            let r = Double.random(in: DesignSystem.minRandomDistance...DesignSystem.maxRandomDistance)
            initialOffsetArray.append(CGPoint(
                x: CGFloat(r * cos(theta)),
                y: CGFloat(r * sin(theta))
            ))
            normalVectorArray.append(normalVector(from: CGPoint.zero, to: CGPoint(
                x: CGFloat(r * cos(theta)),
                y: CGFloat(r * sin(theta))
            )
            ))
            initialDegreeArray.append(CGFloat.random(in: 0..<360))
            colorArray.append(Color(
                red: Double.random(in: 0.6...0.88),
                green: Double.random(in: 0.7...0.9),
                blue: Double.random(in: 0.85...0.95)
            ))
        }
    }

    var body: some View {
        ZStack {
            // pills
            ZStack {
                ForEach(0..<DesignSystem.stickCount, id: \.self) { i in
                    StickView(color: colorArray[i])
                        .rotationEffect(Angle(degrees: initialDegreeArray[i] + (rotationTrigger ? 0.0 : 360.0)))
                        .offset(x: initialOffsetArray[i].x + (tensionTrigger ? normalVectorArray[i].x * 100 : 0), y: initialOffsetArray[i].y + (tensionTrigger ? normalVectorArray[i].y * 100 : 0))
                        .animation(.easeInOut(duration: DesignSystem.rotationPeriod).repeatForever(autoreverses: true), value: rotationTrigger)
                        .animation(.easeInOut(duration: DesignSystem.tensionPeriod * 0.5), value: tensionTrigger)
                }
                
            }
            .opacity(0.3)
            .rotationEffect(Angle(degrees: revolutionTrigger ? 0.0 : 360.0))
            .animation(.linear(duration: DesignSystem.revolutionPeriod).repeatForever(autoreverses: false), value: revolutionTrigger)

            Text(DesignSystem.titleName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.serif)
                .offset(y: -250)
            
            LogInView()
                .opacity(0.7)
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { timer in
                rotationTrigger = true
                revolutionTrigger = true
                tensionTrigger = true
            })
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
