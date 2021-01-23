//
//  ProductViewController.swift
//  Shop
//
//  Created by Максим Вечирко on 23.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ProductViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurateUI()
    }
    
    private func configurateUI() {
        self.configurateTableView()
        self.viewModel.productResultProtocol = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewModel.fetchProduct()
    }
    
    private func configurateTableView() {
        let xib = UINib(nibName: "Cell", bundle: nil)
        self.tableView.register(xib, forCellReuseIdentifier: "Cell")
    }

}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.model
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.TLabel.text = model[indexPath.row].product_name
        cell.SLabel.text = "Цена: \(model[indexPath.row].amount) $, В наличии \(model[indexPath.row].quantity) шт."
        return cell
    }
    
    
}



extension ProductViewController: ProductResultProtocol {
    func refresh() {
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
}
