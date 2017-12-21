//
//  CustomHeaderView.swift
//  SplitTableView
//
//  Created by MAC01 on 21/12/17.
//  Copyright © 2017 Jayanta Gogoi. All rights reserved.
//

import UIKit

@IBDesignable

class CustomHeaderView: UIView {
 
        @IBInspectable var shadowColor: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255.0), blue: (244.0/255.0), alpha:1.0)
        @IBInspectable var borderColor: UIColor = UIColor.gray
        
        @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.5, height: 0.5)
        @IBInspectable var shadowRadius: CGFloat = 5
        @IBInspectable var borderWidth: CGFloat = 0.5
        @IBInspectable var cornerRadius: CGFloat = 0.0
        @IBInspectable var shadowOpacity: Float = 0.1
        
        
        override init(frame: CGRect){
            
            super.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        
        override func draw(_ rect: CGRect) {
            
            self.updateView()
            
        }
        
        func updateView(){
            
            self.layer.masksToBounds = false
            self.layer.shadowColor = self.shadowColor.cgColor
            self.layer.shadowOpacity = self.shadowOpacity
            self.layer.shadowOffset =  self.shadowOffset//CGSize(width: -1, height: 1)
            self.layer.shadowRadius = self.shadowRadius
            
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
            
            self.layer.backgroundColor = UIColor.clear.cgColor
            self.layer.cornerRadius = self.cornerRadius
            self.layer.borderColor = self.borderColor.cgColor
            self.layer.borderWidth = self.borderWidth
            
            self.layer.shadowColor = self.shadowColor.cgColor
            self.layer.shadowRadius = self.shadowRadius
            
        }
        
}
