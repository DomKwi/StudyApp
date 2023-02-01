//
//  ContentView.swift
//  StudyApp
//
//  Created by Dominik Kwiecien on 24/01/2023.
//

import SwiftUI

struct ContentView: View {
    //@AppStorage("ALERT_KEY") var notificationAlert = true
    @State var notificationAlert = NotificationClass(notificationAlert1: true)
    
    var body: some View {
        if notificationAlert.notificationAlert1 == false {
            SliderView()
        } else {
            SliderView()
                .alert(isPresented: $notificationAlert.notificationAlert1) {
                    Alert(
                        title: Text("Notification"),
                        message: Text("Do you want to receive notifications from our app"),
                        primaryButton: .default(
                            Text("Accept"),
                            action: {
                                notificationAlert.notificationAlert1 = false
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
