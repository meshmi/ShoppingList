//
//  CheckboxButton.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 6/30/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class CheckboxButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var circleLayer = CAShapeLayer()
    private var fillCircleLayer = CAShapeLayer()
    override var isSelected: Bool {
        didSet {
            self.toggleCheckbox()
        }
    }
    
    var circleLayerColor = UIColor.lightGray.cgColor {
        didSet {
            circleLayer.strokeColor = circleLayerColor
        }
    }
    
    var circleFillColor = Defaults.UI.blueSolid.cgColor {
        didSet {
            fillCircleLayer.fillColor = circleFillColor
        }
    }
    
    @IBInspectable var circleRadius : CGFloat = 10.0
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    private func circleFrame() -> CGRect {
        var cFrame = CGRect(x: 0.0, y: 0.0, width: circleRadius*2, height: circleRadius*2)
        cFrame.origin.x = CGFloat(8.0) + circleLayer.lineWidth
        cFrame.origin.y = bounds.height/2 - cFrame.height/2
        return cFrame
    }
    
    func toggleCheckbox() {
        if self.isSelected {
            fillCircleLayer.fillColor = circleFillColor
            circleLayer.strokeColor = circleFillColor
        } else {
            fillCircleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = circleLayerColor
            
    func setup() {
        circleLayer.frame = bounds
        circleLayer.lineWidth = 1.0
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = circleLayerColor
        layer.addSublayer(circleLayer)
        
        fillCircleLayer.frame = bounds
        fillCircleLayer.lineWidth = 0.5
        fillCircleLayer.fillColor = circleFillColor
        fillCircleLayer.strokeColor = circleLayerColor
        layer.addSublayer(fillCircleLayer)
        toggleCheckbox()
    }
    
    func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        fillCircleLayer.frame = bounds
        }
    
    }
}

}



