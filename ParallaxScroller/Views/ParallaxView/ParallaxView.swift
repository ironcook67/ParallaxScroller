//
//  ParallaxView.swift
//  ParallaxScroller
//
//  Created by Chon Torres on 9/24/22.
//

import SwiftUI

struct ParallaxView: View {
	@Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
	@State var parentSize: CGSize
	@State var parallaxFactor: CGFloat
	@State var imageName: String

	var parallaxScale: CGFloat {
		1.0 + (2.0 * parallaxFactor)
	}

	init(imageName: String, parentSize: CGSize, parallaxFactor: CGFloat = 0.125) {
		_imageName = State(wrappedValue: imageName)
		_parentSize = State(wrappedValue: parentSize)
		_parallaxFactor = State(wrappedValue: parallaxFactor)
	}

	var body: some View {
		GeometryReader { proxy in
			let imageSize = CGSize(width: proxy.size.width, height: proxy.size.height)

			// Parallax Paramters
			let parallaxParameter = (0.0 ... 1.0).clamp(proxy.frame(in: .global).midY / (parentSize.height))
			let parallaxOffsetTotal = parallaxFactor * proxy.size.height
			let parallaxOffset: CGFloat = lerp(-parallaxOffsetTotal/2.0, parallaxOffsetTotal/2.0, parallaxParameter)

			ZStack {
				Image(imageName)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(maxWidth: .infinity)
					.offset(.init(width: 0.0, height: accessibilityReduceMotion ? 0.0 : parallaxOffset))
					.frame(width: imageSize.width * parallaxScale,
						   height: imageSize.height * parallaxScale)
					.frame(width: imageSize.width, height: imageSize.height)
					.clipped()
			}
		}
	}

	func lerp<T: SignedNumeric>(_ a: T, _ b: T, _ t: T) -> T {
		return a + t * (b - a);
	}
}

struct ParallaxView_Previews: PreviewProvider {
	static var previews: some View {
		ParallaxView(imageName: "NeptuneIR", parentSize: CGSize(width: 430, height: 1000))
	}
}

extension ClosedRange {
	func clamp(_ value : Bound) -> Bound {
		return self.lowerBound > value ? self.lowerBound
		: self.upperBound < value ? self.upperBound
		: value
	}
}
