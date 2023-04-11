//
//  SliderView.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 26/01/2023.
//

import SwiftUI

struct SliderView: View {
    @State var time = 15.0
    @StateObject private var vm = ViewModel()
    @State private var selectedDate = Date()
    let notify = NotificationManager()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            Color(hue: 0.58, saturation: 0.06, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Button {
                        print("clicked")
                    } label: {
                        Image(systemName: "gear")
                    }
                }
                
                VStack{
                    SliderModelView(value: $time, in: 5...60)
                        .frame(width: 250, height: 250)
                    
                    HStack {
                        Button("Start") {
                            if time > 59.9 {
                                vm.minutes = Float(time) + 1
                                vm.startTimer(minutes: vm.minutes)
                            } else {
                                vm.minutes = Float(time)
                                vm.startTimer(minutes: vm.minutes)
                            }
                        }
                        .disabled(vm.isActive)
                        
                        Text("\(vm.time)")
                            .alert("You made IT", isPresented: $vm.showingAlert) {
                                Button("Continue", role: .cancel) {
                                    
                                }
                            }
                        
                        Button("Reset", action: vm.reset)
                            .tint(.red)
                    }
                }
            }
            .onReceive(timer) { _ in
                vm.countDown()
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
