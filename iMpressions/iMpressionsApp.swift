//
//  iMpressionsApp.swift
//  iMpressions
//
//  Created by Marcello Gonzatto Birkan on 06/03/24.
//

import SwiftUI
import SwiftData

@main
struct iMpressionsApp: App {
    var body: some Scene {
        WindowGroup {
            MediaListView()
        }
        .modelContainer(for: Media.self)
    }
}
