//
//  SetView.swift
//  Wouk
//
//  Created by Sushil Chaudhary on 11/8/19.
//  Copyright © 2021 Promatics Technologies Private Limited. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
class SetView: UIView {
    
    @IBInspectable open var BorderColor:UIColor = UIColor.lightGray {
        didSet {
            self.UpdateBorder()
        }
    }
    
    @IBInspectable open var BorderWidth:CGFloat = 0 {
        didSet {
            self.UpdateBorder()
        }
    }
    
    @IBInspectable open var isCircle:Bool = false {
        didSet {
            self.UpdateCornerRadious()
        }
    }

    @IBInspectable open var CornerRadius:CGFloat = 0 {
        didSet {
            self.UpdateCornerRadious()
            
        }
    }
    
    @IBInspectable open var EnableShadow:Bool = false {
        didSet {
            self.SetShadow()
        }
    }
    
    @IBInspectable open var ShadowColor:UIColor = UIColor.lightGray {
        didSet {
            self.SetShadow()
        }
    }
    
    @IBInspectable open var ShadowRadius:CGFloat = 0 {
        didSet {
            self.SetShadow()
        }
    }
    
    @IBInspectable open var ShadowOpacity:Float = 0 {
        didSet {
            self.SetShadow()
        }
    }

    @IBInspectable open var ShadowOffsetX:CGFloat = 0 {
        didSet {
            self.SetShadow()
        }
    }
    
    @IBInspectable open var ShadowOffsetY:CGFloat = 0 {
        didSet {
            self.SetShadow()
        }
    }
    
    @IBInspectable open var BounceButton:Bool = false
    
    func UpdateBorder(){
        self.layer.borderWidth = BorderWidth
        self.layer.borderColor = BorderColor.cgColor
        self.layer.masksToBounds = true
    }
    
    func UpdateCornerRadious(){
        if isCircle {
            self.layer.cornerRadius = self.frame.size.width/2
        }else {
            self.layer.cornerRadius = CornerRadius
        }
    }
    
//    @IBInspectable open var SetGardient:Bool = false {
//        didSet {
//            self.updateGardient()
//        }
//    }
    
    func SetShadow(){
        
        if EnableShadow {
            
            self.layer.masksToBounds = false
            
            self.layer.shadowColor = ShadowColor.cgColor
            
            self.layer.shadowOpacity = ShadowOpacity
            
            self.layer.shadowOffset = CGSize(width: ShadowOffsetX, height: ShadowOffsetY)
            
            self.layer.shadowRadius = ShadowRadius
            
        }
        
    }
    
//    private func updateGardient() {
//
//        self.setGradientColor(with: [UIColor.appLightGreen, UIColor.appLightBlue])
//
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(self.BounceButton){
            self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
                
                self.transform = CGAffineTransform.identity
                
            }, completion: nil)
        }

        super.touchesBegan(touches, with: event)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isUserInteractionEnabled = true
        super.touchesEnded(touches, with: event)
    }
}
