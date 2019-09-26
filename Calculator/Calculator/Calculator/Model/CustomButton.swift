//
//  CustomButton.swift
//  Calculator
//
//  Created by Symbat Bashkeyeva on 9/7/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 42
        self.layer.masksToBounds = false
    }
    
    func setStyle(by identifier: ButtonIdentifier) {
        self.tag = identifier.rawValue
        self.setTitle(identifier.title, for: .normal)
        self.backgroundColor = identifier.backgroudColor
        self.setTitleColor(identifier.titleColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    }

}
