//
//  DoubleExt.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation

extension Double {
    func formattedString() -> String {
        if self.truncatingRemainder(dividingBy: 1) == .zero {
            String(format: "%.0f", self)
        } else {
            String(format: "%.3f", self)
        }
    }
}
