//
//  ParallaxScrollerApp.swift
//  ParallaxScroller
//
//  Created by Chon Torres on 9/22/22.
//

import SwiftUI

@main
struct ParallaxScrollerApp: App {
    var body: some Scene {
        WindowGroup {
			ParallaxScrollerView()
				.preferredColorScheme(.dark)
        }
    }
}
