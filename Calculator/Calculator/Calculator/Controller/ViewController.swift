//
//  ViewController.swift
//  Calculator
//
//  Created by Symbat Bashkeyeva on 9/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //views
    let numberReflectionView = UIView()
    let stackViewContainer = UIStackView()
    let firstHorizontalView = UIStackView()
    let secondHorizontalView = UIStackView()
    let thirdHorizontalView = UIStackView()
    let fourthHorizontalView = UIStackView()
    let fifthHorizontalView = UIStackView()
    
    //buttons
    var oneButton = CustomButton()
    var twoButton = CustomButton()
    var threeButton = CustomButton()
    var fourButton = CustomButton()
    var fiveButton = CustomButton()
    var sixButton = CustomButton()
    var sevenButton = CustomButton()
    var eightButton = CustomButton()
    var nineButton = CustomButton()
    var plusButton = CustomButton()
    var minusButton = CustomButton()
    var divideButton = CustomButton()
    var multiplyButton = CustomButton()
    var equalButton = CustomButton()
    var ACButton = CustomButton()
    var percentButton = CustomButton()
    var signButton = CustomButton()
    var decimalButton = CustomButton()
    var zeroButton = CustomButton()
    //label
    var displayLabel = UILabel()
    
    var firstValue: Double? = 0
    var secondValue: Double? = 0
    var result: Double = 0
    
    var operand: ButtonIdentifier?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setViewConstraints()
        stylizeViews()
        
        [oneButton, twoButton, threeButton,
         fourButton, fiveButton, sixButton,
         sevenButton, eightButton, nineButton,
         zeroButton, multiplyButton, minusButton, divideButton, plusButton, equalButton, ACButton].forEach { button in
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func addSubviews() {
        view.addSubview(numberReflectionView)
        numberReflectionView.addSubview(displayLabel)
        
        view.addSubview(stackViewContainer)
        stackViewContainer.addArrangedSubview(firstHorizontalView)
        stackViewContainer.addArrangedSubview(secondHorizontalView)
        stackViewContainer.addArrangedSubview(thirdHorizontalView)
        stackViewContainer.addArrangedSubview(fourthHorizontalView)
        stackViewContainer.addArrangedSubview(fifthHorizontalView)
        
        firstHorizontalView.addArrangedSubview(ACButton)
        firstHorizontalView.addArrangedSubview(signButton)
        firstHorizontalView.addArrangedSubview(percentButton)
        firstHorizontalView.addArrangedSubview(divideButton)
        
        secondHorizontalView.addArrangedSubview(sevenButton)
        secondHorizontalView.addArrangedSubview(eightButton)
        secondHorizontalView.addArrangedSubview(nineButton)
        secondHorizontalView.addArrangedSubview(multiplyButton)
        
        thirdHorizontalView.addArrangedSubview(fourButton)
        thirdHorizontalView.addArrangedSubview(fiveButton)
        thirdHorizontalView.addArrangedSubview(sixButton)
        thirdHorizontalView.addArrangedSubview(minusButton)
        
        fourthHorizontalView.addArrangedSubview(oneButton)
        fourthHorizontalView.addArrangedSubview(twoButton)
        fourthHorizontalView.addArrangedSubview(threeButton)
        fourthHorizontalView.addArrangedSubview(plusButton)
        
        fifthHorizontalView.addArrangedSubview(zeroButton)
        fifthHorizontalView.addArrangedSubview(decimalButton)
        fifthHorizontalView.addArrangedSubview(equalButton)
    }
    
    func setViewConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        numberReflectionView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            numberReflectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            numberReflectionView.bottomAnchor.constraint(equalTo: numberReflectionView.topAnchor, constant: 300),
            numberReflectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92),
            numberReflectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            displayLabel.widthAnchor.constraint(equalTo: numberReflectionView.widthAnchor),
            displayLabel.heightAnchor.constraint(equalTo: numberReflectionView.heightAnchor, multiplier: 0.4),
            displayLabel.topAnchor.constraint(equalTo: numberReflectionView.topAnchor, constant: 200)
        ]
        
        stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            stackViewContainer.topAnchor.constraint(equalTo: numberReflectionView.bottomAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            stackViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92),
            
        ]
        
        layoutConstraints += [
            firstHorizontalView.widthAnchor.constraint(equalTo: stackViewContainer.widthAnchor),
            firstHorizontalView.heightAnchor.constraint(equalTo: stackViewContainer.heightAnchor, multiplier: 0.2),
            secondHorizontalView.widthAnchor.constraint(equalTo: stackViewContainer.widthAnchor),
            secondHorizontalView.heightAnchor.constraint(equalTo: stackViewContainer.heightAnchor, multiplier: 0.2),
            thirdHorizontalView.widthAnchor.constraint(equalTo: stackViewContainer.widthAnchor),
            thirdHorizontalView.heightAnchor.constraint(equalTo: stackViewContainer.heightAnchor, multiplier: 0.2),
            fourthHorizontalView.widthAnchor.constraint(equalTo: stackViewContainer.widthAnchor),
            fourthHorizontalView.heightAnchor.constraint(equalTo: stackViewContainer.heightAnchor, multiplier: 0.2),
            fifthHorizontalView.widthAnchor.constraint(equalTo: stackViewContainer.widthAnchor),
            fifthHorizontalView.heightAnchor.constraint(equalTo: stackViewContainer.heightAnchor, multiplier: 0.2)
            
        ]
        
        layoutConstraints += [
            ACButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            ACButton.heightAnchor.constraint(equalTo: divideButton.widthAnchor),
            signButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            signButton.heightAnchor.constraint(equalTo: ACButton.widthAnchor),
            percentButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            percentButton.heightAnchor.constraint(equalTo: ACButton.widthAnchor),
            divideButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            divideButton.heightAnchor.constraint(equalTo: ACButton.widthAnchor),
        ]
        
        layoutConstraints += [
            sevenButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            sevenButton.heightAnchor.constraint(equalTo: multiplyButton.widthAnchor),
            eightButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            eightButton.heightAnchor.constraint(equalTo: sevenButton.widthAnchor),
            nineButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            nineButton.heightAnchor.constraint(equalTo: sevenButton.widthAnchor),
            multiplyButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            multiplyButton.heightAnchor.constraint(equalTo: sevenButton.widthAnchor),
        ]
        
        layoutConstraints += [
            fourButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            fourButton.heightAnchor.constraint(equalTo: minusButton.widthAnchor),
            fiveButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            fiveButton.heightAnchor.constraint(equalTo: fourButton.widthAnchor),
            sixButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            sixButton.heightAnchor.constraint(equalTo: fourButton.widthAnchor),
            minusButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            minusButton.heightAnchor.constraint(equalTo: fourButton.widthAnchor),
        ]
        
        layoutConstraints += [
            oneButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            oneButton.heightAnchor.constraint(equalTo: plusButton.widthAnchor),
            twoButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            twoButton.heightAnchor.constraint(equalTo: oneButton.widthAnchor),
            threeButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            threeButton.heightAnchor.constraint(equalTo: oneButton.widthAnchor),
            plusButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            plusButton.heightAnchor.constraint(equalTo: oneButton.widthAnchor),
        ]
        
        layoutConstraints += [
            zeroButton.widthAnchor.constraint(equalTo: fifthHorizontalView.widthAnchor, multiplier: 0.47),
            zeroButton.heightAnchor.constraint(equalTo: decimalButton.widthAnchor),
            decimalButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            decimalButton.heightAnchor.constraint(equalTo: equalButton.widthAnchor),
            equalButton.widthAnchor.constraint(equalTo: firstHorizontalView.widthAnchor, multiplier: 0.22),
            equalButton.heightAnchor.constraint(equalTo: decimalButton.widthAnchor),
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }

    func stylizeViews() {
        view.backgroundColor = .black
        numberReflectionView.backgroundColor = .black
        
        stackViewContainer.addBackground(color: .black)
        stackViewContainer.axis = .vertical
        stackViewContainer.distribution = .equalSpacing
        
        firstHorizontalView.axis = .horizontal
        firstHorizontalView.distribution = .equalSpacing
        
        ACButton.setStyle(by: .clear)
        signButton.setStyle(by: .sign)
        percentButton.setStyle(by: .percent)
        divideButton.setStyle(by: .divide)
        
        secondHorizontalView.axis = .horizontal
        secondHorizontalView.distribution = .equalSpacing
        
        sevenButton.setStyle(by: .seven)
        eightButton.setStyle(by: .eight)
        nineButton.setStyle(by: .nine)
        multiplyButton.setStyle(by: .multiply)
        
        thirdHorizontalView.axis = .horizontal
        thirdHorizontalView.distribution = .equalSpacing
        
        fourButton.setStyle(by: .four)
        fiveButton.setStyle(by: .five)
        sixButton.setStyle(by: .six)
        minusButton.setStyle(by: .minus)
        
        fourthHorizontalView.axis = .horizontal
        fourthHorizontalView.distribution = .equalSpacing
        
        oneButton.setStyle(by: .one)
        twoButton.setStyle(by: .two)
        threeButton.setStyle(by: .three)
        plusButton.setStyle(by: .plus)
        
        fifthHorizontalView.axis = .horizontal
        fifthHorizontalView.distribution = .equalSpacing
        
        zeroButton.setStyle(by: .zero)
        decimalButton.setStyle(by: .decimal)
        equalButton.setStyle(by: .equal)
        
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 90)
        displayLabel.textColor = .white
        displayLabel.text = "0"
        displayLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print(sender.tag)
        guard let id = ButtonIdentifier(rawValue: sender.tag) else { return }
        switch id {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            didSelectNumber(with: id)
        case .plus, .minus, .multiply, .divide:
            didSelectOperand(with: id)
        case .equal:
            calculate()
            operand = .equal
        case .clear:
            clear()
        default: break
        }
    }
    
    private func didSelectNumber(with id: ButtonIdentifier) {
        if operand == .equal {
            reset()
        }
        if operand == nil {
            if firstValue == nil {
                firstValue = 0
            }
            guard let firstValue = firstValue else { return }
            self.firstValue = firstValue*10 + Double(id.rawValue)
            displayLabel.text = self.firstValue?.description
            print("first baby", firstValue)
        } else {
            if secondValue == nil {
                secondValue = 0
            }
            guard let secondValue = secondValue else { return }
            self.secondValue = secondValue*10 + Double(id.rawValue)
            displayLabel.text = self.secondValue?.description
            print("second baby", secondValue)
        }
        
    }
    
    private func didSelectOperand(with id: ButtonIdentifier) {
        if operand != nil && secondValue != nil {
            calculate()
            firstValue = result
            secondValue = nil
        }
        operand = id
        guard let operand = operand else {
            return
        }
        switch operand {
        case .plus:
            print("hey")
        case .minus:
            print("hey")
        case .multiply:
            print("hey")
        case .divide:
            print("hey")
        default:
            break
        }
    }
    
    private func calculate() {
        guard let firstValue = firstValue else { return }
        guard let secondValue = secondValue else { return }
        guard let operand = operand else { return}
        switch operand {
        case .plus:
            result = firstValue + secondValue
        case .minus:
            result = firstValue - secondValue
        case .multiply:
            result = firstValue * secondValue
        case .divide:
            result = firstValue / secondValue
        default:
            break
        }
        displayLabel.text = result.description
    }
    
    private func clear() {
        displayLabel.text = "0"
        reset()
    }
    
    func reset() {
        result = 0
        operand = nil
        firstValue = nil
        secondValue = nil
    }
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

