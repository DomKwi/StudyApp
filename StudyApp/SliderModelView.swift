//
//  SliderContoler.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 24/01/2023.
//

import SwiftUI

struct SliderModelView: View {
    @State var progress = 0.33
    let ringDiamater = 300.0
    @State var rotationAngle = Angle(degrees: 120)
    
    private func changeAngel(location: CGPoint) -> Angle {
        let vector = CGVector(dx: location.x, dy: -location.y)
        
        let angleRadians = atan2(vector.dx, vector.dy)
        
        let positiveAngles = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        
        progress = positiveAngles / (2.0 * .pi)
        
        return Angle(radians:  positiveAngles)
    }
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.04, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Circle()
                        .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9), lineWidth: 20.0)
                        .overlay() {
                            Text("\(progress, specifier: "%.2f")")
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
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged() { value in
                                    rotationAngle = changeAngel(location: value.location)
                                }
                            )
                }
                .frame(width: ringDiamater, height: ringDiamater)
                
                Spacer()
            }
            .padding(.vertical, 40)
            .padding()
        }
    }
}

struct SliderModelView_Previews: PreviewProvider {
    static var previews: some View {
        SliderModelView()
    }
}
