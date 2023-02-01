//
//  ContentView.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 24/01/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("ALERT_KEY") var notificationAlert = true
    
    var body: some View {
        if notificationAlert == false {
            SliderView()
        } else {
            SliderView()
                .alert(isPresented: $notificationAlert) {
                    Alert(
                        title: Text("Notification"),
                        message: Text("Do you want to receive notifications from our app"),
                        primaryButton: .default(
                            Text("Accept"),
                            action: {
                                notificationAlert = false
                            }
                        ),
                        secondaryButton: .cancel()
                    )
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
