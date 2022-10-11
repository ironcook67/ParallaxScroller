//
//  ParallaxScrollerView.swift
//  ParallaxScroller
//
//  Created by Chon Torres on 9/22/22.
//

import SwiftUI

struct ParallaxScrollerView: View {
	var body: some View {
		VStack{
			GeometryReader { proxy in
				let imageWidth = proxy.size.width * 0.90
				let imageHeight = imageWidth * 0.5625
				ScrollView {
					VStack(alignment: .center, spacing: 50) {
						ForEach (0...20, id: \.self) { _ in
							HStack {
								Spacer()
								ParallaxView(imageName: "NeptuneIR", parentSize: proxy.size)
									.frame(width: imageWidth, height: imageHeight)
									.overlay {
										Rectangle()
											.stroke(Color.mint, lineWidth: 2)
									}
								Spacer()
							}
						}
					}
				}
			}
		}
		.ignoresSafeArea()
		.background {
			Color.blue
				.ignoresSafeArea()
				.opacity(0.2)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ParallaxScrollerView()
	}
}
