//
//  ViewController.swift
//  Calculator
//
//  Created by Meirkhan Nishonov on 12.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
//    private lazy var sizeOfLabels:
    private lazy var topView = UIView()
    private lazy var displayLabel: UILabel = {
        let label = UILabel()
        label.text = "123456"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 70)
        return label
    }()
    
    private lazy var bottomView = UIView()
    
    private lazy var firstView = UIView()
    private lazy var buttonAC = UIButton.createButton(with: "AC", and: .gray)
    private lazy var buttonPlusMinus = UIButton.createButton(with: "±", and: .gray)
    private lazy var buttonPercent = UIButton.createButton(with: "%", and: .gray)
    private lazy var buttonDivide = UIButton.createButton(with: "÷", and: .orange)
    
    private lazy var secondView = UIView()
    private lazy var buttonSeven = UIButton.createButton(with: "7", and: .gray)
    private lazy var buttonEight = UIButton.createButton(with: "8", and: .gray)
    private lazy var buttonNine = UIButton.createButton(with: "9", and: .gray)
    private lazy var buttonMultiply = UIButton.createButton(with: "x", and: .orange)
    
    private lazy var thirdView = UIView()
    private lazy var buttonFour = UIButton.createButton(with: "4", and: .gray)
    private lazy var buttonFive = UIButton.createButton(with: "5", and: .gray)
    private lazy var buttonSix = UIButton.createButton(with: "6", and: .gray)
    private lazy var buttonMinus = UIButton.createButton(with: "-", and: .orange)
    
    private lazy var fourthView = UIView()
    private lazy var buttonOne = UIButton.createButton(with: "1", and: .gray)
    private lazy var buttonTwo = UIButton.createButton(with: "2", and: .gray)
    private lazy var buttonThree = UIButton.createButton(with: "3", and: .gray)
    private lazy var buttonPlus = UIButton.createButton(with: "+", and: .orange)
    
    private lazy var fifthView = UIView()
    private lazy var buttonZero = UIButton.createButton(with: "0", and: .gray)
    private lazy var buttonColon = UIButton.createButton(with: ",", and: .gray)
    private lazy var buttonEqual = UIButton.createButton(with: "=", and: .orange)
    
//    private var sizeOfLabels: CGFloat = 65
//    private var grayColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
////    private var grayColorByHex =  UIColor(hex: "F00")
//    private var orangeColor =  UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
//    private lazy var myLabelInput: UILabel = {
//        let label = UILabel()
//        label.text = "0"
//        label.textColor = .white
//        label.font = UIFont.boldSystemFont(ofSize: 80)
//        return label
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.black
        
        setupViews()
        setupConstraints()
    }
    

}

//Mark: - Setup vievs and constraints methods

private extension ViewController{
    
    func setupViews(){
        view.addSubview(topView)
        view.addSubview(bottomView)
        
        topView.addSubview(displayLabel)
        
        bottomView.addSubview(firstView)
        bottomView.addSubview(secondView)
        bottomView.addSubview(thirdView)
        bottomView.addSubview(fourthView)
        bottomView.addSubview(fifthView)
        
        firstView.addSubview(buttonAC)
        firstView.addSubview(buttonPlusMinus)
        firstView.addSubview(buttonPercent)
        firstView.addSubview(buttonDivide)
        
        secondView.addSubview(buttonSeven)
        secondView.addSubview(buttonEight)
        secondView.addSubview(buttonNine)
        secondView.addSubview(buttonMultiply)
        
        thirdView.addSubview(buttonFour)
        thirdView.addSubview(buttonFive)
        thirdView.addSubview(buttonSix)
        thirdView.addSubview(buttonMinus)
        
        fourthView.addSubview(buttonOne)
        fourthView.addSubview(buttonTwo)
        fourthView.addSubview(buttonThree)
        fourthView.addSubview(buttonPlus)
        
        
        fifthView.addSubview(buttonZero)
        fifthView.addSubview(buttonColon)
        fifthView.addSubview(buttonEqual)

    }
    func setupConstraints(){
        
        topView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.4)
        }
        
        displayLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        firstView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5)
        }
        setupButtons(buttonOne: buttonAC, buttonTwo: buttonPlusMinus, buttonThree: buttonPercent, buttonFour: buttonDivide)
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5)
        }
        
        setupButtons(buttonOne: buttonSeven, buttonTwo: buttonEight, buttonThree: buttonNine, buttonFour: buttonMultiply)
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5)
        }
        setupButtons(buttonOne: buttonFour, buttonTwo: buttonFive, buttonThree: buttonSix, buttonFour: buttonMinus)
        
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thirdView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5)
        }
        
        setupButtons(buttonOne: buttonOne, buttonTwo: buttonTwo, buttonThree: buttonThree, buttonFour: buttonPlus)
        
        fifthView.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        buttonZero.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        buttonColon.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(buttonZero.snp.trailing)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonEqual.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
        }
        
        
    }
    
    func setupButtons(buttonOne: UIButton, buttonTwo: UIButton, buttonThree: UIButton, buttonFour: UIButton) {
        
        buttonOne.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonTwo.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(buttonOne.snp.trailing)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonThree.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(buttonTwo.snp.trailing)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonFour.snp.makeConstraints { make in
            make.leading.equalTo(buttonThree.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }
        
    }
}

extension UIButton{
    static func createButton(with text: String, and color: UIColor) -> UIButton{
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 45
        return button
    }
}
