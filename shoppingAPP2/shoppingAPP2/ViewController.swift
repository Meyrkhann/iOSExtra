//
//  ViewController.swift
//  shoppingAPP2
//
//  Created by Meirkhan Nishonov on 17.02.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private lazy var marketTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.IDENTIFIER)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
//        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        marketTableView.dataSource = self
        marketTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }


}


//MARK: - Table view data source and delegate methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataBase.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.IDENTIFIER, for: indexPath) as! MarketTableViewCell
        cell.configure(with: DataBase.productList[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.15
    }
    
    
}


//MARK: - Setup views and constraints methods

private extension ViewController {
    
    func setupViews(){
        view.addSubview(marketTableView)
    }
    
    func setupConstraints(){
        marketTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
    }
    
}

