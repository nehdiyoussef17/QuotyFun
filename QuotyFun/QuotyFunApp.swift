//
//  QuotyFunApp.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import SwiftUI
import Firebase

@main
struct QuotyFunApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("App Launched !")
        FirebaseApp.configure()
        return true
    }
}
