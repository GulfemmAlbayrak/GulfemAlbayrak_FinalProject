//
//  DetailViewController.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import UIKit
import MusicAPI

protocol DetailViewControllerProtocol: AnyObject {
    func setImage(_ image: String)
    func setArtistName(_ text: String)
    func setTrackCount(_ text: String)
    func trackName(_ text: String)
    func genreName(_ text: String)
    func getSource() -> MusicResult?
}

final class DetailViewController: BaseViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackCount: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var genreName: UILabel!
    
    var presenter: DetailPresenterProtocol!
    var musicResult: MusicResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        //presenter?.playButtonTapped()
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {

    func setImage(_ image: String) {
        if let image = UIImage(named: image) {
            self.image.image = image
        }
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
//func configureView(with musicResult: MusicResult) {
//   // Use the `musicResult` property to populate the UI elements
//
//       artistName.text = musicResult.artistName
//       trackCount.text = "\(musicResult.trackCount)"
//       trackName.text = musicResult.trackName
//       genreName.text = musicResult.primaryGenreName
//       // Set the image using the music result's image URL or any other relevant data
//       // image.image = ...
//
//}
