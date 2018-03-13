//
//  UIImageView+UIAdditions.swift
//  5gmark-pro
//
//  Created by Martin Prot on 30/08/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import UIKit

extension UIImageView {
	@IBInspectable var tintedImage: Bool {
		get {
			guard let image = self.image else { return false }
			return image.renderingMode == .alwaysTemplate
		}
		set {
			guard let image = self.image else { return }
			if newValue {
				self.image = image.withRenderingMode(.alwaysTemplate)
			}
			else {
				self.image = image.withRenderingMode(.alwaysOriginal)
			}
		}
	}
	
	func tintMe() {
		self.image = self.image?.withRenderingMode(.alwaysTemplate)
	}
}
