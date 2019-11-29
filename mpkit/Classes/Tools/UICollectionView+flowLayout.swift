//
//  UICollectionView+flowLayout.swift
//  mpkit
//
//  Created by Martin Prot on 29/11/2019.
//

import UIKit

extension UICollectionView {
	
	/// A simple method that casts the collection view layout as a flow layout and returns it as an optional
	public var flowLayout: UICollectionViewFlowLayout? {
		return self.collectionViewLayout as? UICollectionViewFlowLayout
	}
}
