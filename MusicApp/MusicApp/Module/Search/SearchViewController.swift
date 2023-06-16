
import UIKit
import MusicAPI

protocol SearchViewControllerProtocol: AnyObject {
    
    func showLoadingView()
    func hideLoadingView()
    func getSearchText() -> String
    func configureSearchBar()
    func configureTableView()
    func update(with musicResult: [MusicResult])
    func showError(_ message:String)
    func setTitle(_ title: String)
}

final class SearchViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchPresenterProtocol!
    var searchResults: [MusicResult] = []
    
    let searchBarIdentifier = "searchBarIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Is embedded in UINavigationController: \(navigationController != nil)")
        presenter.viewDidLoad()
        setAccessibilityIdentifier()
    }
}

extension SearchViewController: SearchViewControllerProtocol {

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
                self.titleLabel.text = "Welcome to iTunes"
                self.titleLabel.isHidden = false
            } else if musicResult.isEmpty {
                self.tableView.isHidden = true
                self.titleLabel.text = "No Result Found "
                self.titleLabel.isHidden = false
            } else {
                self.tableView.isHidden = false
                self.titleLabel.isHidden = true
            }
        }
    }
    
    func showError(_ message: String) {
        showAlert("Error", message)
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
        cell.accessibilityIdentifier = "Cell_\(indexPath.row)"
        return cell
    }
} 

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell selected at index: \(indexPath.row)")
        presenter.didSelectRowAt(index: indexPath.row)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.getMusic(with: getSearchText())
    }
}

extension SearchViewController {
    func setAccessibilityIdentifier() {
        searchBar.accessibilityIdentifier = "searchBarIdentifier"
        tableView.accessibilityIdentifier = "tableViewIdenfier"

    }
}

