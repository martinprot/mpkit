//
//  KeyboardScrollable.swift
//  mpkit
//
//  Created by Martin Prot on 08/08/2018.
//

import UIKit

public typealias KeyboardNotifications = [Any]

public protocol KeyboardScrollable: AnyObject {
	var scrollView: UIScrollView? { get }
	var scrollInsets: UIEdgeInsets { get }
}

public extension KeyboardScrollable {
	
	var scrollInsets: UIEdgeInsets {
		return .zero
	}
	
	public func registerKeyboardNotifications() -> KeyboardNotifications {
		return [
			NotificationCenter.default.addObserver(forName: .UIKeyboardDidShow, object: nil, queue: nil) { [weak self] notification in
				self?.onKeyboardWillShow(notification: notification)
			},
			NotificationCenter.default.addObserver(forName: .UIKeyboardDidHide, object: nil, queue: nil) { [weak self] notification in
				self?.onKeyboardDidHide(notification: notification)
			}
		]
	}
	
	public func unregisterKeyboardNotifications(_ tokens: KeyboardNotifications?) {
		tokens?.forEach(NotificationCenter.default.removeObserver)
	}
	
	private func onKeyboardWillShow(notification: Notification) {
		guard let userInfo = notification.userInfo,
			let keyboardRectValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
			else { return }
		var insets = self.scrollView?.contentInset ?? .zero
		insets.bottom = keyboardRectValue.cgRectValue.size.height
		self.scrollView?.contentInset = insets
		self.scrollView?.scrollIndicatorInsets = insets
	}
	
	private func onKeyboardDidHide(notification: Notification) {
		self.scrollView?.contentInset = self.scrollInsets
		self.scrollView?.scrollIndicatorInsets = self.scrollInsets
	}
}
