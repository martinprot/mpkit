//
//  Bundle+modules.swift
//  qosiui
//
//  Created by Martin Prot on 12/03/2018.
//

import Foundation

extension Bundle {
	
	public var displayName: String? {
		return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
	}
}
