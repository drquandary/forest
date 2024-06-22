//
//  forestApp.swift
//  forest
//
//  Created by Chatterjee  on 6/8/24.
//

import SwiftUI

@main
struct forestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
