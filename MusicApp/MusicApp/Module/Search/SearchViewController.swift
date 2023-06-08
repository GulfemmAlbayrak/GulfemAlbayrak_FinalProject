//
//  SearchViewController.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import UIKit
import MusicAPI

protocol AnyView {
    var presenter: SearchPresenterProtocol? { get set }
    
    func update(with artist: [MusicResult])
    func update(with error: String)
    
}

class SearchViewController: UIViewController, AnyView {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchPresenterProtocol?
    var searchResults: [MusicResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MusicResultCell", bundle: nil), forCellReuseIdentifier: "MusicResultCell")
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    
    func update(with musicResult: [MusicResult]) {
        print("got musics")
        DispatchQueue.main.async {
            self.searchResults = musicResult
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        print(error)
        DispatchQueue.main.async {
            self.searchResults = []
        }
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicResultCell", for: indexPath) as! MusicResultCell
        let musicResult = searchResults[indexPath.row]
        cell.musicResult = musicResult
        cell.configure(with: musicResult)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchMusic(with: searchText)
    }
}
