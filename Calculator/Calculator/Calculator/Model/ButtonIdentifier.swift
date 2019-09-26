//
//  Numbers.swift
//  Calculator
//
//  Created by Symbat Bashkeyeva on 9/9/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import UIKit

enum ButtonIdentifier: Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case decimal = 10
    case equal = 101
    case plus = 102
    case minus = 103
    case multiply = 104
    case divide = 105
    case clear = 200
    case sign = 201
    case percent = 202
    
    var title: String {
        switch  self {
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .decimal:
            return ","
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "x"
        case .divide:
            return "/"
        case .clear:
            return "AC"
        case .sign:
            return "+/-"
        case .percent:
            return "%"
        }
    }
    
    var backgroudColor: UIColor {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return .darkGray
        case .equal, .plus, .minus, .multiply, .divide:
            return .orange
        case .clear, .sign, .percent:
            return .lightGray
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .clear, .sign, .percent:
            return .black
        default:
            return .white
        }
    }
}
