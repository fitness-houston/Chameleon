//
//  UIButton.swift
//  Chameleon
//
//  Created by 유정주 on 2022/03/23.
//

import UIKit

extension UIButton {
    func applyMainButtonStyle(title: String) {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        self.setBackgroundColor(UIColor.buttonColor, for: .normal)
        self.setBackgroundColor(UIColor.buttonClickColor, for: .selected)
        self.layer.cornerRadius = 20 //heigth: 40 고정
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        if UITraitCollection.current.userInterfaceStyle == .light {
            self.setTitleColor(.white, for: .disabled)
        } else {
            self.setTitleColor(.lightGray, for: .disabled)
        }
    }
    
    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        if let color = color {
            UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
            
            let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.setBackgroundImage(backgroundImage, for: state)
        }
    }
}
