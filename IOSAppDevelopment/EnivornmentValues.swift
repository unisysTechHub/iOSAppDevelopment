//
//  EnivornmentValues.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 06/01/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation

import SwiftUI

// MARK: - CurrencyFormatter

private struct CurrencyFormatterKey: EnvironmentKey {
    static var defaultValue: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .currency
        return formatter
    }()
}

// MARK: - NumberFormatter

private struct NumberFormatterKey: EnvironmentKey {
    static var defaultValue = NumberFormatter()
}

extension EnvironmentValues {
    var currencyFormatter: NumberFormatter {
        get { self[CurrencyFormatterKey.self] }
        set { self[CurrencyFormatterKey.self] = newValue }
    }
    
    var numberFormatter: NumberFormatter {
        get { self[NumberFormatterKey.self] }
        set { self[NumberFormatterKey.self] = newValue }
    }
}
let screenBounds = UIScreen.main.bounds
let maxWidth = screenBounds.size.width
