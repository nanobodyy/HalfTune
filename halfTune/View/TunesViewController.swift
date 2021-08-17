//
//  TunesViewController.swift
//  halfTune
//
//  Created by Гурген on 17.08.2021.
//

import UIKit

class TunesViewController: UIViewController {
    
    lazy private var searchResultTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height))
    
    private var searchBar = UISearchBar()
    
    var viewModel: TunesVCViewModel?
    
    lazy var tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        searchBar.delegate = self
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(searchResultTableView)
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() {
        searchResultTableView.register(TuneCell.self, forCellReuseIdentifier: TuneCell.reuseID)
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.rowHeight = 50
    }
    
    func configureNavBar() {
        
        title = "Search Tune"
        navigationController?.navigationBar.barTintColor = UIColor(red: 232/255, green: 96/255, blue: 110/255, alpha: 1.0)
        navigationItem.rightBarButtonItem = createBarButtonItem(color: .black)
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .red // изменение цвета cancel
    }
    
    @objc func searchItemTap() {
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = nil
        
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
    }
    
    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func createBarButtonItem (color: UIColor) -> UIBarButtonItem {
        let bar = UIBarButtonItem(barButtonSystemItem: .search,
                                  target: self,
                                  action: #selector(searchItemTap))
        bar.tintColor = color
        
        return bar
    }

}

extension TunesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = createBarButtonItem(color: .black)
        searchBar.showsCancelButton = false
        searchBar.text = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        viewModel?.fetchTunes(name: searchText)
        searchResultTableView.reloadData()
    }
}

extension TunesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultTableView.dequeueReusableCell(withIdentifier: TuneCell.reuseID) as! TuneCell
        
        let cellViewModel = viewModel?.createViewModelForCell(indexPath: indexPath.row)
        cell.viewModel = cellViewModel
        cell.configureUI()
        
        return cell
    }
}

extension TunesViewController: UITableViewDelegate {
    
}
