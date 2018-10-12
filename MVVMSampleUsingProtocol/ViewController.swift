//
//  ViewController.swift
//  MVVMSampleUsingProtocol
//
//  Created by for Work on 5/30/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireObjectMapper


class TableViewController: UITableViewController {
    
    var tableViewData = [ArticleModel]()
    var viewModel: ArticleViewModel?
//    var delegate: FetchDelegate? = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "News Articles"
        

//        delegate?.fetchArticles(completion: { (tableViewData) in
//            self.tableViewData = tableViewData ?? []
//            self.tableView.reloadData()
//        })
        
        viewModel = ArticleViewModel()
        viewModel?.delegate = self
        viewModel?.fetchArticles()
    }
}

extension TableViewController: FetchDelegate {
    
    func presentList(info: [ArticleModel]?) {
        //guard tableViewData == info! else { return }
        guard let info = info else { return }
        self.tableViewData = info
        tableView.reloadData()
    }
}

extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let fetchData = tableViewData[indexPath.row]
        let titleLabel = cell.viewWithTag(10) as? UILabel
        titleLabel?.text = fetchData.title
        let nameLabel = cell.viewWithTag(20) as? UILabel
        nameLabel?.text = fetchData.source?.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) != nil {
            let urlString = tableViewData[indexPath.row].url
            guard let url = urlString else {
                return
            }
            let link = URL(string: url)
            UIApplication.shared.open(link!)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}











