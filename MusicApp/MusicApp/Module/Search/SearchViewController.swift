//
//  SearchViewController.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import UIKit
import MusicAPI

protocol SearchViewProtocol: AnyObject {
    
    func showLoadingView()
    func hideLoadingView()
    func getSearchText() -> String
    func configureSearchBar()
    func configureTableView()
    func update(with musicResult: [MusicResult])
    func update(with error: String)
    func setTitle(_ title: String)
}

final class SearchViewController: BaseViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchPresenterProtocol!
    var searchResults: [MusicResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    

}
extension SearchViewController: SearchViewProtocol {
    
    
    func getSearchText() -> String {
        return searchBar.text ?? ""
    }
    
     func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MusicResultCell", bundle: nil), forCellReuseIdentifier: "MusicResultCell")
    }
    
     func configureSearchBar() {
        searchBar.delegate = self
    }
    
    func update(with musicResult: [MusicResult]) {
        print("got musics")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.searchResults = musicResult
            self.tableView.reloadData()
            
            if self.getSearchText().isEmpty {
                self.tableView.isHidden = true
                self.titleLabel.text = "iTunes'a hoş Geldiniz!"
                self.titleLabel.isHidden = false
            } else if musicResult.isEmpty {
                self.tableView.isHidden = true
                self.titleLabel.text = "Sonuç bulunamadı"
                self.titleLabel.isHidden = false
            } else {
                self.tableView.isHidden = false
                self.titleLabel.isHidden = true
            }
        }
    }
    
    func update(with error: String) {
        print(error)
        DispatchQueue.main.async {
            self.searchResults = []
        }
    }
    
    func showLoadingView(){
        showLoading()
    }
    
    func hideLoadingView(){
        hideLoading()
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicResultCell", for: indexPath) as! MusicResultCell
        let musicResult = searchResults[indexPath.row]
        cell.musicResult = musicResult
        cell.configure(with: musicResult)
        return cell
    }


} 

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(index: indexPath.row)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.getMusic(with: getSearchText())
    }
    
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        tableView.isHidden = true
//        titleLabel.isHidden = false
//        return true
//    }
    
}
