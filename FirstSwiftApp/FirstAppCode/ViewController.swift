//
//  ViewController.swift
//  FirstAppCode
//
//  Created by Meirkhan Nishonov on 10.01.2023.
//
import SnapKit
import UIKit
class ViewController: UIViewController {
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "I am Rich"
        label.textColor = .yellow
//        label.textColor.cgColor()
        return label
    }()
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Account: XXXX$"
        label.textColor = .yellow
        return label
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
//        button.titleLabel?.text = "Change"
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor.clear.withAlphaComponent(0.2)
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 60)
//        button.setBackgroundImage(UIImage(named: "transparent"), for: .normal)
//        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var myDiamond: UIImageView = {
        let imageViev = UIImageView()
        imageViev.image = UIImage(named: "diamond")
        return imageViev
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .systemGreen
        view.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1)
        
        setupViews()
        setupConstraints()
        myButton.addTarget(self, action: #selector(changeAccount), for: .touchUpInside)
    }
    @objc func changeAccount() {
        let newBalance = String(Int.random(in: 1000...10000)) + "$"
        accountLabel.text = "Account: \(newBalance)"
        view.backgroundColor = .random()
    }


}

//Mark: - Setup vievs and constraints methods

private extension ViewController{
    func setupViews(){
        view.addSubview(myLabel)
        view.addSubview(myDiamond)
        view.addSubview(accountLabel)
        view.addSubview(myButton)
        
    }
    
    func setupConstraints(){
        
        myLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(myDiamond.snp.top)
        }
        
        myDiamond.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
        accountLabel.snp.makeConstraints { make in
            make.top.equalTo(myDiamond.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        myButton.snp.makeConstraints { make in
            make.top.equalTo(accountLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}

extension UIColor {
  static func random () -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1.0)
  }
}

