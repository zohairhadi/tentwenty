//
//  UITabBar+.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import Foundation
import UIKit

@IBDesignable class TabBarWithCorners: UITabBar {
	@IBInspectable var color: UIColor?
	@IBInspectable var radii: CGFloat = 27.0

	private var shapeLayer: CALayer?

	override func draw(_ rect: CGRect) {
		addShape()
	}

	private func addShape() {
		color = UIColor(named: "primary")
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = createPath()
		shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
		shapeLayer.fillColor = UIColor(named: "Primary")?.cgColor ?? UIColor.white.cgColor
		shapeLayer.lineWidth = 2
		
		// add shadow
//		shapeLayer.shadowColor = UIColor.black.cgColor
//		shapeLayer.shadowOffset = CGSize(width: 0, height: -3)
//		shapeLayer.shadowOpacity = 0.2
//		shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
		
		if let oldShapeLayer = self.shapeLayer {
			layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
		} else {
			layer.insertSublayer(shapeLayer, at: 0)
		}
		self.shapeLayer = shapeLayer
	}

	private func createPath() -> CGPath {
		let path = UIBezierPath(
			roundedRect: bounds,
			byRoundingCorners: [.topLeft, .topRight],
			cornerRadii: CGSize(width: radii, height: 0.0))

		return path.cgPath
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.isTranslucent = true
		self.backgroundColor = .white
		var tabFrame            = self.frame
		tabFrame.size.height    = 65 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
		tabFrame.origin.y       = self.frame.origin.y +   ( self.frame.height - 65 - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
		self.layer.cornerRadius = 27
		self.frame            = tabFrame

		self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
	}
}
