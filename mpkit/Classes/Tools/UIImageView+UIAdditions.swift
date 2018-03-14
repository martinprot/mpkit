//
//  UIImageView+UIAdditions.swift
//  mpkit
//
//  Created by Martin Prot on 30/08/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import UIKit

extension UIImageView {
	@IBInspectable public var tintedImage: Bool {
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
	
	public func tintMe() {
		self.image = self.image?.withRenderingMode(.alwaysTemplate)
	}
}
