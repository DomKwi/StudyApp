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
        @Published var time: String = "15:00"
        @Published var minutes: Float = 15.0 {
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
        
        func countDown() {
            
            guard isActive else { return }
            
            let timeItIsNow = Date()
            let difference = endDate.timeIntervalSince1970 - timeItIsNow.timeIntervalSince1970
            
            if difference <= 0 {
                
                self.isActive = false
                self.time = "0:00"
                self.showingAlert = true
                return
            }
            
            let date = Date(timeIntervalSince1970: difference)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)
        }
    }
}
