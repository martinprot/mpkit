//
//  UILoadingButton.swift
//  AnimatedCollectionViewLayout
//
//  Created by Martin Prot on 12/04/2018.
//

import UIKit

public class UILoadingButton: UIButton {
	
	public var isLoading: Bool = false
	
	public var loadingStyle: UIActivityIndicatorViewStyle = .white
	
	override public var isEnabled: Bool {
		didSet {
			self.alpha = self.isEnabled ? 1 : 0.7
		}
	}
	
	@IBInspectable public var cornerRadius: CGFloat = 0
	
	private var buttonTitle: String?
	private var buttonImage: UIImage?
	
	private var activity: UIActivityIndicatorView {
		let activity = UIActivityIndicatorView(activityIndicatorStyle: self.loadingStyle)
		activity.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
		activity.hidesWhenStopped = true
		activity.tintColor = self.titleColor(for: .normal)
		return activity
	}
	
	override public func awakeFromNib() {
		super.awakeFromNib()
		self.layer.cornerRadius = cornerRadius
		self.clipsToBounds = true
		self.alpha = self.isEnabled ? 1 : 0.5
	}
	
	public func startLoading() {
		if !self.isLoading {
			let activity = self.activity
			activity.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
			self.addSubview(activity)
			activity.startAnimating()
			self.buttonTitle = self.title(for: .normal)
			self.buttonImage = self.image(for: .normal)
			self.setTitle(.none, for: .normal)
			self.setImage(.none, for: .normal)
			self.isLoading = true
			self.isEnabled = false
			
		}
	}
	
	override public func setImage(_ image: UIImage?, for state: UIControlState) {
		if self.isLoading, state == .normal {
			self.buttonImage = image
		}
		else {
			super.setImage(image, for: state)
		}
	}
	
	public func stopLoading() {
		if self.isLoading {
			self.isEnabled = true
			self.isLoading = false
			self.activity.stopAnimating()
			self.setTitle(self.buttonTitle, for: .normal)
			self.setImage(self.buttonImage, for: .normal)
		}
	}
}
