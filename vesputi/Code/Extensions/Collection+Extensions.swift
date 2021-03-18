//
//  Collection+Extensions.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import Foundation

extension Swift.Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
