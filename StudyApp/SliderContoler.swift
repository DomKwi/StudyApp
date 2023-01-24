//
//  SliderContoler.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 24/01/2023.
//

import SwiftUI

struct SliderContoler: View {
    @State var progress = 0.33
    let ringDiamater = 300.0
    
    private var rotationAngle: Angle {
        return Angle(degrees: (360.0 * progress))
    }
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.04, brightness: 1.0)
                .edgesIgnoringSafeArea(.all
                )
            VStack {
                ZStack {
                    Circle()
                        .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9), lineWidth: 20.0)
                        .overlay() {
                            Text("\(progress, specifier: "%.1f")")
                                .font(.system(size: 78, weight: .bold, design: .rounded))
                        }
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.9),
                                style: StrokeStyle(lineWidth: 20.0, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                    Circle()
                        .fill(Color.white)
                        .frame(width: 21, height: 21)
                        .offset(y: -ringDiamater / 2.0)
                        .rotationEffect(rotationAngle)
                }
                .frame(width: ringDiamater, height: ringDiamater)
                
                VStack {
                    Text("Progress: \(progress, specifier: "%.1f")")
                    Slider(value: $progress,
                           in:  0...1,
                           minimumValueLabel: Text("0.0"),
                           maximumValueLabel: Text("1.0")
                    ) {}
                }
                .padding(.vertical, 40)
                
                Spacer()
            }
            .padding(.vertical, 40)
            .padding()
        }
    }
}

struct SliderContoler_Previews: PreviewProvider {
    static var previews: some View {
        SliderContoler()
    }
}
