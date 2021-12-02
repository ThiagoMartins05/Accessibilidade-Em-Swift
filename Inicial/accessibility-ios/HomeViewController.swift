//
//  ViewController.swift
//  accessibility-ios
//
//  Created by Thiago Martins on 25/11/21.
//

import UIKit
import Combine


class HomeViewController: UIViewController {
    
    

    let viewModel = HomeViewModelType()
    private unowned var screenView: HomeView { return self.view as! HomeView }
    private var subscriptions = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = HomeView()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
        screenView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.setup(with: viewModel.characters[indexPath.row])
        return cell
    }
}

