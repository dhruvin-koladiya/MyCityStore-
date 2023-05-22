//
//  Extension.swift
//  MyCityStore
//
//  Created by R82 on 28/03/23.
//

import Foundation
import UIKit

var passwordlength = 6
var phoneNumberRegx = "^+(?:[0-9] ?){6,14}[0-9]$"
var emailAddressRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"


extension String {
    
    var trimmed: String {
        return String(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
    var isValidEmailAddress : Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailAddressRegx)
        return emailTest.evaluate(with: self)
    }
    var isValidPhoneNumber : Bool {
        let phoneRegex = phoneNumberRegx
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    var isValidString : Bool { !(self.count == 0) }
    var isPwdLenth : Bool { self.count >= passwordlength }
    var isPasswordValid : Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,15}")
        return passwordTest.evaluate(with: self)
    }
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    
    var length: Int { self.count }
    
    var firstCharacter: String? {
        return Array(self).map({String($0)}).first
    }
    
    var hasLetters: Bool {
        return (rangeOfCharacter(from: NSCharacterSet.letters, options: .numeric, range: nil) != nil)
    }
    
    var hasNumbers: Bool {
        return (rangeOfCharacter(from: NSCharacterSet.decimalDigits, options: .literal, range: nil) != nil)
    }
    var isAlphabetic: Bool {
        return  hasLetters && !hasNumbers
    }
    var isNumeric: Bool {
        return  !hasLetters && hasNumbers
    }
    
    var lastCharacter: String? {
        guard let last = Array(self).map({String($0)}).last else {
            return nil
        }
        return String(last)
    }
}


extension UIView {
    func setCorner(radious: CGFloat) {
        layer.cornerRadius = radious
        layer.masksToBounds = true
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}

extension UIColor {
    convenience init(hex: UInt32) {
let mask = 0x000000FF
let r = Int(hex >> 16) & mask
let g = Int(hex >> 8) & mask
let b = Int(hex) & mask
let red = CGFloat(r) / 255
let green = CGFloat(g) / 255
let blue = CGFloat(b) / 255
self.init(red:red, green:green, blue:blue, alpha:1)
        
}
    
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count{
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

 }

