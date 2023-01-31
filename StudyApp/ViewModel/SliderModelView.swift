//
//  SliderContoler.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 24/01/2023.
//

import SwiftUI

struct SliderModelView: View {
    @Binding var progress: Double
    @State private var rotationAngle = Angle(degrees: 0)
    
    private var minValue = 0.0
    private var maxValue = 1.0
    
    init(value progress: Binding<Double>, in bounds: ClosedRange<Int> = 0...1) {
        self._progress = progress
        
        self.minValue = Double(bounds.first ?? 0)
        self.maxValue = Double(bounds.last ?? 1)
        self.rotationAngle = Angle(degrees: progressFraction * 360.0)
    }
    
    private var progressFraction: Double {
        return ((progress - minValue) / (maxValue - minValue))
    }
    
    
    private func changeAngel(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: -location.y)
        
        let angleRadians = atan2(vector.dx, vector.dy)
        
        let positiveAngles = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        
        progress = ((positiveAngles / (2.0 * .pi)) * (maxValue - minValue)) + minValue
        
        rotationAngle = Angle(radians: positiveAngles)
        
    }
    
    var body: some View {
        GeometryReader { gr in
            let radius = (min(gr.size.width, gr.size.height) / 2.0 ) * 0.9
            let sliderWidth = radius * 0.1
            
            VStack(spacing: 0) {
                ZStack {
                    Circle()
                        .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9),
                                style: StrokeStyle(lineWidth: sliderWidth))
                        .overlay() {
                            Text("\(progress, specifier: "%.0f")")
                                .font(.system(size: radius * 0.7, weight: .bold, design: .rounded))
                        }
                    Circle()
                        .trim(from: 0, to: progressFraction)
                        .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.9),
                                style: StrokeStyle(lineWidth: sliderWidth, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                    Circle()
                        .fill()
                        .shadow(radius: (sliderWidth * 0.3))
                        .frame(width: sliderWidth, height: sliderWidth)
                        .offset(y: -radius)
                        .rotationEffect(rotationAngle)
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged() { value in
                                    changeAngel(location: value.location)
                                }
                        )
                }
                .frame(width: radius * 2.0, height: radius * 2.0, alignment: .center)
                .padding(radius * 0.1)
            }
            .onAppear {
                self.rotationAngle = Angle(degrees: progressFraction * 360.0)
            }
        }
    }
}
                
            
    
    struct SliderModelView_Previews: PreviewProvider {
        static var previews: some View {
            
            SliderModelView(value: .constant(6), in: 0...100)
        }
    }

