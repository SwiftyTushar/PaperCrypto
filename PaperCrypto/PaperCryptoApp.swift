//
//  PaperCryptoApp.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 01/02/24.
//

import SwiftUI

@main
struct PaperCryptoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
