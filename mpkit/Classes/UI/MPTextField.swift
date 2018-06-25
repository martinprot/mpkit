//
//  MPTextField.swift
//  mpkit
//
//  Created by Martin Prot on 29/05/2018.
//

import UIKit

/// A textfield with more control:
/// • border color & radius
/// • placeholder color
/// • horizontal text insets (same for left and right
class MPTextField: UITextField {
	
	@IBInspectable var borderColor: UIColor = .clear { didSet { updateUI() } }
    @IBInspectable var borderSize: CGFloat = -1 { didSet { updateUI() } }
	@IBInspectable var cornerRadius: CGFloat = 0 { didSet { updateUI() } }
	@IBInspectable var placeholderColor: UIColor = .gray { didSet { updateUI() } }
	@IBInspectable var xTextInsets: CGFloat = 0 { didSet { self.setNeedsLayout() } }
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	private func updateUI() {
		if self.borderColor == .clear {
			self.layer.borderWidth = 0
		}
		else {
            if self.borderSize < 0 {
                self.layer.borderWidth = 1.0 / UIScreen.main.scale
            }
            else {
                self.layer.borderWidth = self.borderSize
            }
			self.layer.borderColor = self.borderColor.cgColor
		}
		
		self.layer.cornerRadius = self.cornerRadius
		if self.cornerRadius > 0 {
			self.clipsToBounds = false
		}
		if let text = self.placeholder {
			self.attributedPlaceholder = NSAttributedString(string: text,
															attributes: [.foregroundColor: self.placeholderColor])
		}
	}
	
	// placeholder position
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: self.xTextInsets, dy: 0)
	}
	
	// text position
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: self.xTextInsets, dy: 0)
	}
	
	override var placeholder: String? {
		didSet {
			guard let text = self.placeholder else { return }
			self.attributedPlaceholder = NSAttributedString(string: text,
															attributes: [.foregroundColor: self.placeholderColor])
		}
	}
}
