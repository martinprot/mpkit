//
//  CGFloat+conversions.swift
//  5gmark-crowd
//
//  Created by Martin Prot on 06/12/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import UIKit

protocol CGFloatConvertible {
	var cgFloat: CGFloat { get }
}

extension Int: CGFloatConvertible {
	var cgFloat: CGFloat {
		return CGFloat(self)
	}
}

extension Double: CGFloatConvertible {
	var cgFloat: CGFloat {
		return CGFloat(self)
	}
}

extension Float: CGFloatConvertible {
	var cgFloat: CGFloat {
		return CGFloat(self)
	}
}

