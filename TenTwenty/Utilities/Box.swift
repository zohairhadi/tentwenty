//
//  Box.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import Foundation

final class Box<T> {
	
	typealias Listener = (T) -> Void
	var listener: Listener?
	
	var value: T {
		didSet {
		  listener?(value)
		}
	}
	
	init(_ value: T) {
		self.value = value
	}
	
	func bind(listener: Listener?) {
		self.listener = listener
		listener?(value)
	}
}
