//
//  CGPoint+operations.swift
//  5gmark-crowd
//
//  Created by Martin Prot on 12/12/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import UIKit

extension CGPoint {
	
	static func +(left: CGPoint, right: CGPoint) -> CGPoint {
		return CGPoint(x: left.x + right.x, y: left.y + right.y)
	}

}
