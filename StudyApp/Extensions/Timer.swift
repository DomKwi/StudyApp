//
//  Timer.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 30/01/2023.
//

import Foundation

extension SliderView {
    final class ViewModel: ObservableObject {
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "5:00"
        @Published var minutes: Float = 5.0 {
            didSet {
                self.time = "\(Int(minutes)):00"
            }
        }
        
        private var initTime = 0
        private var endDate = Date()
        
        func startTimer(minutes: Float) -> () {
            self.initTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
        
        func reset() {
         
            self.minutes = Float(initTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
            
        }
    }
}
