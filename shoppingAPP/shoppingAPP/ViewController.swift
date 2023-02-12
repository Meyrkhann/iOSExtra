//
//  ViewController.swift
//  shoppingAPP
//
//  Created by Meirkhan Nishonov on 15.01.2023.
//


import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let myItems: [[String]] = [["PP1","English","Calculus","Linear algebra"], ["Data Structures and Algorithms","Kazakh language", "Statistics", "Database"], ["introduction to business","Audit","Django"]]
    private let myTitles: [String] = ["1st year programms", "2nd year programms", "3rd year programms"]
    
    private lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.IDENTIFIER)
        tableView.backgroundColor = .systemBlue
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        
        myTableView.dataSource = self
        myTableView.delegate = self
                
        setupViews()
        setupConstraints()
    }
}

//MARK: - Table view data source methods

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(myTitles[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.IDENTIFIER, for: indexPath) as! MyTableViewCell
//        cell.setText(with: "Product\(indexPath.section).\(indexPath.row)")
        cell.setText(with: "\(myItems[(indexPath.section)][(indexPath.row)])")
        cell.backgroundColor = .clear
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

//MARK: - Setup views and constraints methods

private extension ViewController {
    
    func setupViews() {
        view.addSubview(myTableView)
    }
    
    func setupConstraints() {
        myTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
