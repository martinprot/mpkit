//
//  MPLanguage.swift
//  mpkit
//
//  Created by Martin Prot on 05/10/2017.
//  Copyright © 2017 Appricot media. All rights reserved.
//

import Foundation

extension Notification.Name {
	public static let languageChanged = Notification.Name("languageChangedNotification")
}

public enum MPLanguage: String {
	case english = "en"
	case french = "fr"
	
	private static let userDefaultKey = "MPCurrentLanguage"
	
	public static let `default`: MPLanguage = .english
	
	public static var current: MPLanguage {
		get {
			guard let lang = UserDefaults.standard.string(forKey: MPLanguage.userDefaultKey) else {
				return NSLocale.preferredLanguages.first.map { MPLanguage(from: $0) } ?? .default
			}
			return MPLanguage(from: lang)
		}
		set {
			UserDefaults.standard.set(newValue.toString, forKey: MPLanguage.userDefaultKey)
			NotificationCenter.default.post(name: .languageChanged, object: nil)
		}
	}
	
	public var toString: String {
		return rawValue
	}
	
	public init(from: String) {
		if let range = from.range(of: "-") {
			let sub = String(from[..<range.lowerBound])
			self = MPLanguage(rawValue: sub) ?? .default
		}
		else {
			self = MPLanguage(rawValue: from) ?? .default
		}
	}
}

extension String {
	
	public var localized: String {
		let currentLanguage = MPLanguage.current
		guard let path = Bundle.main.path(forResource: currentLanguage.toString, ofType: "lproj"),
			  let langBundle = Bundle(path: path)
		else { return self }
		return langBundle.localizedString(forKey: self, value: nil, table: nil)
	}
}
