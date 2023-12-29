//
//  iOSCoreDataApp.swift
//  iOSCoreData
//
//  Created by A'zamjon Abdumuxtorov on 29/12/23.
//

import SwiftUI

@main
struct iOSCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
