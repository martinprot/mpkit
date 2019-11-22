//
//  UINavigationController+completion.swift
//  mpkit
//
//  Created by Martin Prot on 22/11/2019.
//

import Foundation

/// These methods add a completion bloc on UINavigationController navigation methods.
///	The completion bloc is called after a push/pop/popToRoot animation is accomplished
/// If animated is set to false, the completion fires immediately
extension UINavigationController {
	
	public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
		self.pushViewController(viewController, animated: animated)
		guard animated, let coordinator = transitionCoordinator else {
			completion()
			return
		}
		coordinator.animate(alongsideTransition: nil) { _ in completion() }
	}
	
	public func popViewController(animated: Bool, completion: @escaping () -> Void) {
		self.popViewController(animated: animated)
		guard animated, let coordinator = transitionCoordinator else {
			completion()
			return
		}
		coordinator.animate(alongsideTransition: nil) { _ in completion() }
	}
	
	public func popToRootViewController(animated: Bool, completion: @escaping () -> Void) {
		self.popToRootViewController(animated: animated)
		guard animated, let coordinator = transitionCoordinator else {
			completion()
			return
		}
		coordinator.animate(alongsideTransition: nil) { _ in completion() }
	}
	
	public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool, completion: @escaping () -> Void) {
		self.setViewControllers(viewControllers, animated: animated)
		guard animated, let coordinator = transitionCoordinator else {
			completion()
			return
		}
		coordinator.animate(alongsideTransition: nil) { _ in completion() }
	}
}
