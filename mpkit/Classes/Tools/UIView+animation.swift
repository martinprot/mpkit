//
//  UIView+MP.swift
//  mpkit
//
//  Created by Martin Prot on 06/10/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import UIKit

extension TimeInterval {
	public static let quickAnimationDuration: TimeInterval = 0.2
	public static let standardAnimationDuration: TimeInterval = 0.4
	public static let slowAnimationDuration: TimeInterval = 0.8
}

extension CGFloat {
	public static let invisible: CGFloat = 0
	public static let opaque: CGFloat = 1
	public static let almostOpaque: CGFloat = 0.8
}


extension UIView {
	
	/// Shows the view animated. Un-hide the view if isHidden is true
	///
	/// - Parameters:
	///   - duration: the animation duration
	///   - completion: callback on completion
	public func showAnimated(duration: TimeInterval = .standardAnimationDuration, delayed: TimeInterval = 0, completion: (() -> ())? = .none) {
		if self.isHidden {
			self.alpha = 0
			self.isHidden = false
		}
		UIView.animate(withDuration: duration, delay: delayed, options: [], animations: {
			self.alpha = 1
		}) { _ in
			completion?()
		}
	}
	
	/// Hides the view animated. View isHidden is set to true at animation end
	///
	/// - Parameters:
	///   - duration: the animation duration
	///   - completion: callback on completion
	public func hideAnimated(duration: TimeInterval = .standardAnimationDuration, delayed: TimeInterval = 0, completion: (() -> ())? = .none) {
		if self.isHidden { return }
		UIView.animate(withDuration: duration, delay: delayed, options: [], animations: {
			self.alpha = 0
		}) { _ in
			self.isHidden = true
			self.alpha = 1
			completion?()
		}
	}
	
	/// Shake animation for UIViews
	///
	/// - Parameters:
	///   - duration: the total animation duration
	///   - count: the number of shakes
	///   - amplitude: the amount of pixel the animation shifts
	public func shake(during duration: TimeInterval = .standardAnimationDuration, count: Float = 4, amplitude: CGPoint = CGPoint(x: 10, y: 0)){
		let animation = CABasicAnimation(keyPath: "position")
		animation.duration = duration/Double(count)
		animation.repeatCount = count
		animation.autoreverses = true
		animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - amplitude.x, y: self.center.y - amplitude.y))
		animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + amplitude.x, y: self.center.y + amplitude.y))
		self.layer.add(animation, forKey: "position")
	}
	
	public static func animateCurvy(duration: TimeInterval = .standardAnimationDuration, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = .none) {
		animate(withDuration: .standardAnimationDuration, delay: 0, options: .curveEaseInOut, animations: animations, completion: completion)
	}
	
	public static func animateSpringly(duration: TimeInterval = .standardAnimationDuration, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = .none) {
		animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: animations, completion: completion)
	}
}
