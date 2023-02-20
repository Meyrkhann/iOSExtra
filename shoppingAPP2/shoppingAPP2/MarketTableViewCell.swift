//
//  MarketTableViewCell.swift
//  shoppingAPP2
//
//  Created by Meirkhan Nishonov on 17.02.2023.
//

import UIKit

final class MarketTableViewCell: UITableViewCell {

    static let IDENTIFIER = "MarketTableViewCell"
    
    private let textView = UIView()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .label
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemRed
//
        
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product){
        productNameLabel.text = product.name
        productPriceLabel.text = "\(product.tourPrice) $"
        productImageView.image = UIImage(named: product.imageName)
        
    }
    
}


//MARK: - Setup views and constraints methods

private extension MarketTableViewCell {
    
    func setupViews(){
        contentView.addSubview(textView)
        textView.addSubview(productNameLabel)
        textView.addSubview(productPriceLabel)
        contentView.addSubview(productImageView)
    }
    
    func setupConstraints(){
        textView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(15)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
        }
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        productImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(textView.snp.trailing)
        }
        
        
    }
    
}
