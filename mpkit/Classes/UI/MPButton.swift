//
//  MPButton.swift
//  mpkit
//
//  Created by Martin Prot on 15/11/2019.
//

import UIKit

class MPButton: UIButton {
	/// Use this constant on cornerRadius to make a perfectly rounded button
	static let cornerCompletelyRounded: CGFloat = -1
	
	@IBInspectable var borderColor: UIColor = .white { didSet { self.layer.borderColor = self.borderColor.cgColor }}
	@IBInspectable var borderWidth: CGFloat = 0 { didSet { self.layer.borderWidth = self.borderWidth }}
	@IBInspectable var cornerRadius: CGFloat = 0 { didSet { self.refresh() }}
	
	public private(set) var isLoading: Bool = false
	
	public var loadingStyle: UIActivityIndicatorView.Style = .white
	
	private var initialBgColor: UIColor?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		// replacing background color, if any, to an image of the color, in order
		// to handle correctly appearance on selection, hilhligh and disabling
		guard self.backgroundImage(for: .normal) == nil else { return }
		guard let color = self.backgroundColor else { return }
		self.setBackgroundImage(.onePixel(of: color), for: .normal)
	}
	
	private func refresh() {
		if self.cornerRadius == MPButton.cornerCompletelyRounded {
			self.layer.cornerRadius = self.bounds.height/2
		}
		else {
			self.layer.cornerRadius = self.cornerRadius
		}
		self.clipsToBounds = true
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.refresh()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.refresh()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.refresh()
	}
	
	// MARK: Loading stuff
	private var buttonTitle: String?
	private var buttonImage: UIImage?
	private lazy var loader: UIActivityIndicatorView = {
		let activity = UIActivityIndicatorView(style: self.loadingStyle)
		activity.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
		activity.hidesWhenStopped = true
		activity.tintColor = self.titleColor(for: .normal)
		self.addSubview(activity)
		return activity
	}()
	
	public func startLoading() {
		if !self.isLoading {
			self.loader.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
			self.loader.startAnimating()
			self.buttonTitle = self.title(for: .normal)
			self.buttonImage = self.image(for: .normal)
			self.setTitle(.none, for: .normal)
			self.setImage(.none, for: .normal)
			self.isLoading = true
			self.isEnabled = false
			
		}
	}
	
	override open func setImage(_ image: UIImage?, for state: UIControl.State) {
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
			self.loader.stopAnimating()
			self.setTitle(self.buttonTitle, for: .normal)
			self.setImage(self.buttonImage, for: .normal)
		}
	}
}
