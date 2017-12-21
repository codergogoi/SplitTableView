//
//  AppExtensions.swift
//  SplitTableView
//
//  Created by MAC01 on 21/12/17.
//  Copyright © 2017 Jayanta Gogoi. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    func onTapAnimation(){
        
        DispatchQueue.main.async {
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
        }
    }
    
}

extension UITableViewCell {
    
    func onSelectAnimation(){
        
        DispatchQueue.main.async {
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
    }
    
}

extension UIView{
    
    func commitAnimation(){
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
            
            self.layoutIfNeeded()
            
        }) { (finished) in
            
        }
        
    }
}
