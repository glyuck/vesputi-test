//
//  UILabel+HTML.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

extension UILabel {
    func setHTMLText(_ text: String, customStyle: String = "") {
        do {
            let html = "<html><head><style type='text/css'>html,body{margin: 0; padding: 0;font: \(font.css); color: \(textColor.hexString(false));}\(customStyle)</style></head><body>\(text)</body></html>"
            let attributedString = try NSMutableAttributedString(data: html.data(using: .utf8)!, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue,
            ], documentAttributes: nil)
            attributedString.trimCharactersInSet(charSet: .newlines)
            if let lastCharacter = attributedString.string.last, lastCharacter == "\n" {
                attributedString.deleteCharacters(in: NSRange(location: attributedString.length - 1, length: 1))
            }
            attributedText = attributedString
        } catch {
            NSLog("Failed to set html string: \(error)")
        }
    }
}

extension UIColor {
    func hexString(_ includeAlpha: Bool = true) -> String {
        // swiftlint:disable identifier_name
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        // swiftlint:enable identifier_name
        getRed(&r, green: &g, blue: &b, alpha: &a)

        if includeAlpha {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
}

extension UIFont {
    var css: String {
        let familyName: String
        if self.familyName == UIFont.systemFont(ofSize: 10).familyName {
            familyName = "\"-apple-system\", HelveticaNeue, sans-serif"
        } else {
            familyName = "\"\(self.familyName)\", sans-serif"
        }
        return "\(cssFontWeight) \(pointSize)px \(familyName)"
    }

    var cssFontWeight: String {
        if fontName.hasSuffix("Bold") {
            return "bold"
        }
        if fontName.hasSuffix("Medium") {
            return "500"
        }
        if fontName.hasSuffix("Light") {
            return "300"
        }
        if fontName.hasSuffix("Book") {
            return "350"
        }
        if fontName.hasSuffix("Thin") {
            return "100"
        }
        return "normal"
    }
}

public extension NSMutableAttributedString {
    func trimCharactersInSet(charSet: CharacterSet) {
        var range = (string as NSString).rangeOfCharacter(from: charSet)

        // Trim leading characters from character set.
        while range.length != 0, range.location == 0 {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: charSet)
        }

        // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacter(from: charSet, options: .backwards)
        while range.length != 0, NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: charSet, options: .backwards)
        }
    }
}
