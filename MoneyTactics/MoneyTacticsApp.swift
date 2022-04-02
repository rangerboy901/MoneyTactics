//
//  MoneyTacticsApp.swift
//  MoneyTactics
//
//  Created by Joseph DeWeese on 4/2/22.
//

import SwiftUI

@main
struct MoneyTacticsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
