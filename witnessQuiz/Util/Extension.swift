//
//  Util.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/2/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    
    convenience init(hex: Int) {
        
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


let  topBackgroundColor:UIColor = UIColor(hex:0x6195D4)
let  greenCheckMarkColor = UIColor(hex:0x00853F)
let  dukeBlue = UIColor(hex:0x009688)
let  dukeDarkBlue = UIColor(hex:0x005984)
let  dukeGreenColor = UIColor(hexString: "7EB47C")
let  appGrayColor = UIColor(hex:0x808080)
let  dukeRed = UIColor(hexString: "D55E62")
let  dukeGray = UIColor(hex:0x4A4A4A)
let  standardButton = UIColor(hex:0x008BB0)
let  successColor = UIColor(hex:0x1C6B34)
let  errorColor = UIColor(hex:0x9D2235)
let  formBorderInactiveColor = UIColor(hex:0xD8D8D8)
let  activeButtonColor = UIColor(hex:0x007FAC)
let  radioSelectedColor = UIColor(hex: 0x4A4A4A)
let  radioDeselectedColor = UIColor(hex: 0x9B9B9B)
let  linkColor = UIColor(hex:0x077FAA)
let  lineColor = UIColor(hex: 0x979797)
let  lightTextGray = UIColor(hex: 0x696969)
let  buttonDisabled = UIColor(hex:0x999999)
let  darkTextGray = UIColor(hex:0x282828)
let  tableViewBackground = UIColor(hex:0xF2F4F4)
let buttonColor = UIColor(hexString: "0D9EDF")

