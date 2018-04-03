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

extension CGRect {
    public func adding(x: CGFloat) -> CGRect {
        return CGRect(x: self.minX + x, y: self.minY, width: self.width, height: self.height)
    }
    public func adding(y: CGFloat) -> CGRect {
        return CGRect(x: self.minX, y: self.minY + y, width: self.width, height: self.height)
    }
    public func adding(width: CGFloat) -> CGRect {
        return CGRect(x: self.minX, y: self.minY, width: self.width + width, height: self.height)
    }
    public func adding(height: CGFloat) -> CGRect {
        return CGRect(x: self.minX, y: self.minY, width: self.width, height: self.height + height)
    }
    public func adding(size: CGSize) -> CGRect {
        return CGRect(x: self.minX, y: self.minY, width: self.width + size.width, height: self.height + size.height)
    }
    public func adding(position: CGPoint) -> CGRect {
        return CGRect(x: self.minX + position.x, y: self.minY + position.y, width: self.width, height: self.height)
    }
    public func removing(x: CGFloat) -> CGRect { return self.adding(x: -x) }
    public func removing(y: CGFloat) -> CGRect { return self.adding(y: -y) }
    public func removing(width: CGFloat) -> CGRect { return self.adding(width: -width) }
    public func removing(height: CGFloat) -> CGRect { return self.adding(height: -height) }
    public func removing(size: CGSize) -> CGRect {
        return self.adding(size: CGSize(width: -size.width, height: -size.height))
    }
    public func removing(position: CGPoint) -> CGRect {
        return self.adding(position: CGPoint(x: -position.x, y: -position.y))
    }
}

