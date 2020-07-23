//
//  ViewController.swift
//  FactsDemoApp
//
//  Created by BRIJESH SINGH on 20/07/20.
//  Copyright © 2020 com.FactsDemoApp. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    let factsTableView = UITableView()
    var dataSource: FactsDataSource?
    private let refreshControl = UIRefreshControl()
    private var viewModel: FactsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.intialSetUp()
        self.setupUIRefreshControl()
    }
    
    func setupUIRefreshControl() {
        refreshControl.addTarget(self, action: #selector(serviceCall), for: UIControl.Event.valueChanged)
        self.factsTableView.addSubview(refreshControl)
    }
    
    @objc func serviceCall() {
        DispatchQueue.main.async {
            self.viewModel?.fetchServiceCall()
        }
        refreshControl.endRefreshing()
    }
    
    func intialSetUp() {
        view.backgroundColor = .white
        self.setTableView()
        self.registerCells()
        self.viewModel?.fetchServiceCall()
    }
    
    func registerCells() {
        factsTableView.register(FactsTableViewCell.self)
    }
    
    func setTableView(){
        view.addSubview(factsTableView)
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        factsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        factsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        factsTableView.tableFooterView = UIView(frame: .zero)
        
        factsTableView.dataSource = dataSource
        
        factsTableView.estimatedRowHeight = 150
        factsTableView.rowHeight = UITableView.automaticDimension
    }
}

extension FactsViewController: Configurable {
    
    typealias T = FactsViewModel
    
    func bind(to model: FactsViewModel) {
        self.viewModel = model
        self.dataSource = self.viewModel?.dataSource as? FactsDataSource
        
        self.viewModel?.dataSource?.facts.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.factsTableView.reloadData()
        })
        
        self.viewModel?.title.addAndNotify(observer: self, completionHandler: { [weak self] in
            self?.navigationItem.title = self?.viewModel?.title.value
        })
    }
}
