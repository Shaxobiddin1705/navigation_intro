//
//  UIColorExt.swift
//  navigation_intro
//
//  Created by Shaxobiddin on 24/01/24.
//

import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        );
        return randomColor
    }
}
