//
//  SliderView.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 26/01/2023.
//

import SwiftUI

struct SliderView: View {
    @State var time = 15.0
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.06, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                SliderModelView(value: $time, in: 5...120)
                    .frame(width: 250, height: 250)
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
