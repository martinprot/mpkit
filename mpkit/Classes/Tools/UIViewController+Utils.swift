//
//  UIViewController+Utils.swift
//  mpkit
//
//  Created by Martin Prot on 12/03/2018.
//

import UIKit

extension UIViewController {
	
	/// returns the current view controller embedded into a newly created navigation controller
	public func intoNavigation() -> UINavigationController {
		return UINavigationController(rootViewController: self)
	}
	
	/**
	*  Present an alert describing the error, with an optional title
	*
	*/
	public func present(error: Error, title: String? = nil, message: String? = nil, onRetry:(() -> Void)? = nil, onCancel:(() -> Void)? = nil) {
		let ac = UIAlertController(title: title, message: message ?? error.localizedDescription, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Ok".localized, style: .cancel, handler: { _ in
			onCancel?()
		}))
		if let onRetry = onRetry {
			ac.addAction(UIAlertAction(title: "Retry".localized, style: .default, handler: { _ in
				onRetry()
			}))
		}
		present(ac, animated: true, completion: nil)
	}
}
