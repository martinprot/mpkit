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
				self.image = image.tinted
			}
			else {
				self.image = image.notTinted
			}
		}
	}
	
	public func tintMe() {
		self.image = self.image?.tinted
	}
}

extension UIImage {

    public var tinted: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    public var notTinted: UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
}
