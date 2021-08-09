//
//  SearchBar.swift
//  halfTune
//
//  Created by Гурген on 05.08.2021.
//

import UIKit

class SearchView: UIView {
    
    var searchBar = UISearchBar()
    //var tableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setupConstraint()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        //backgroundColor = UIColor(red: 230/255, green: 63/255, blue: 69/255, alpha: 1)
        //searchBar.becomeFirstResponder()
    
        searchBar.sizeToFit()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
//    func setupConstraint() {
//        addSubview(searchBar)
//        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        searchBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//    }
    
    func setupConstraint() {
        addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

