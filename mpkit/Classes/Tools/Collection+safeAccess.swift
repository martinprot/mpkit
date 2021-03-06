//
//  Collection+safeAccess.swift
//  mpkit
//
//  Created by Martin Prot on 25/06/2018.
//

import Foundation

extension Collection {
	
	/// Returns the element at the specified index if it is within bounds, otherwise nil.
	public subscript (safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}
