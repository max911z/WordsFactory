//
//  Extension.swift
//  WordsFactory
//
//  Created by Максим Неверовский on 13.06.2022.
//

import Foundation
import UIKit

extension UIFont{
    
    enum FontType: String{
        case bold = "-Bold"
        case regular = "-Regular"
        case medium = "-Medium"
    }
    
    static func rubik(_ type: FontType, size: CGFloat) -> UIFont{
        return UIFont(name: "Rubik\(type.rawValue)", size: size)!
    }

}
