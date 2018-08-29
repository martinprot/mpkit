//
//  UIViewController+embedding.swift
//  mpkit
//
//  Created by Martin Prot on 26/06/2018.
//

import UIKit

extension UIViewController {
	
	/// Embed the given view controller to sender, in the given view. The view in parameter must be a descendent
	/// of the sender main view. The view controller takes the given view bounds as frame, and automatically
	/// resizes its width and height
	public func embed(viewController: UIViewController?, in view: UIView?) {
		guard let view = view, let viewController = viewController else { return }
		viewController.willMove(toParentViewController: self)
		self.addChildViewController(viewController)
		viewController.view.frame = view.bounds
		view.addSubview(viewController.view)
		viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		viewController.didMove(toParentViewController: self)
	}
	
	/// Properly removes the embedded view controller (in parameter) from its parent (self)
	public func remove(viewController: UIViewController?) {
		viewController?.willMove(toParentViewController: nil)
		viewController?.view.removeFromSuperview()
		viewController?.removeFromParentViewController()
		viewController?.didMove(toParentViewController: nil)
	}
}

