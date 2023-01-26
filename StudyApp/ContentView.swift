//
//  ContentView.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 24/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var progress1 = 0.75
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.06, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                SliderModelView(value: $progress1, in: 5...120)
                    .frame(width: 250, height: 250)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
