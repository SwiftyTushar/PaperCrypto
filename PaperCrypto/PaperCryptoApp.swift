//
//  PaperCryptoApp.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI
import UIKit
import IQKeyboardManagerSwift

@main
struct PaperCryptoApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            if AuthManager.shared.authenticated(){
                NavigationStack{
                    ContentView()
                        .toolbar(.hidden, for: .navigationBar)
                }
            } else {
                WelcomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
    
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        PCSocketManager.sharedInstance.establishSocketConnection()
        IQKeyboardManager.shared.enable = true
//        PCSocketManager.sharedInstance.checkConnection()
        return true
    }
    func applicationWillTerminate(_ application: UIApplication) {
        print("Application will terminate")
    }
}
