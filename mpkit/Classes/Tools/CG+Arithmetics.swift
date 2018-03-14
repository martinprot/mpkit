//
//  CGPoint+operations.swift
//  mpkit
//
//  Created by Martin Prot on 12/12/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import UIKit

extension CGPoint {
	
	public static func +(left: CGPoint, right: CGPoint) -> CGPoint {
		return CGPoint(x: left.x + right.x, y: left.y + right.y)
	}
	public static func -(left: CGPoint, right: CGPoint) -> CGPoint {
		return CGPoint(x: left.x - right.x, y: left.y - right.y)
	}

}

extension CGSize {
	
	public static func +(left: CGSize, right: CGSize) -> CGSize {
		return CGSize(width: left.width + right.width, height: left.height + right.height)
	}
	
	public static func -(left: CGSize, right: CGSize) -> CGSize {
		return CGSize(width: left.width - right.width, height: left.height - right.height)
	}
	
	public static func *(left: CGSize, right: CGFloat) -> CGSize {
		return CGSize(width: left.width * right, height: left.height * right)
	}
	
	public static func /(left: CGSize, right: CGFloat) -> CGSize {
		return CGSize(width: left.width / right, height: left.height / right)
	}
	
	var toPoint: CGPoint {
		return CGPoint(x: self.width, y: self.height)
	}
	
}

