//
//  SearchViewController.swift
//  halfTune
//
//  Created by Гурген on 30.07.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchResultTableView = UITableView()
//    var searchBar: UISearchBar = {
//        let search = UISearchBar()
//        //search.barStyle = .black
//        search.sizeToFit()
//        search.placeholder = "Song name or artist"
//        return search
//    }()
    let searchBar = SearchBar()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureTableView()
        setupConstraint()
    }
    
    func configureTableView() {
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.register(TuneCell.self, forCellReuseIdentifier: TuneCell.reuseID)
        searchResultTableView.tableHeaderView?.tintColor = .red
        //searchResultTableView.tableHeaderView= searchBar
        
    }
    
    func setupConstraint() {
        view.addSubview(searchResultTableView)
        searchResultTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        searchResultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchResultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchResultTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultTableView.dequeueReusableCell(withIdentifier: TuneCell.reuseID, for: indexPath) as! TuneCell
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UISearchBarDelegate {
    
}
