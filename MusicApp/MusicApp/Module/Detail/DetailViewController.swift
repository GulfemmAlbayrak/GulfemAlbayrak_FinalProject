//
//  DetailViewController.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import UIKit
import MusicAPI

protocol DetailViewControllerProtocol: AnyObject {
    func setImage(_ image: UIImage?)
    func setArtistName(_ text: String)
    func setTrackCount(_ text: String)
    func trackName(_ text: String)
    func genreName(_ text: String)
    func getSource() -> MusicResult?
    func playButtonTapped()
}

final class DetailViewController: BaseViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackCount: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var genreName: UILabel!
    
    weak var searchViewController: SearchViewController?
    
    var presenter: DetailPresenterProtocol!
    var musicResult: MusicResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

//        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
//         navigationItem.leftBarButtonItem = backButton
    }
//
//     @objc private func backButtonTapped() {
//         navigationController?.popViewController(animated: true)
//     }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        playButtonTapped()
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {
    func playButtonTapped() {
        presenter.playButtonTapped()
    }
    

    func setImage(_ image: UIImage?) {
        self.image.image = image
    }
    
    func setArtistName(_ text: String) {
        self.artistName.text = text
    }
    
    func setTrackCount(_ text: String) {
        self.trackCount.text = text
    }
    
    func trackName(_ text: String) {
        self.trackName.text = text
    }
    
    func genreName(_ text: String) {
        self.genreName.text = text
    }
    
    func getSource() -> MusicResult? {
        return musicResult
    }
    
}

