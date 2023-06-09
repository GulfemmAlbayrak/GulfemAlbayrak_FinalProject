//
//  DetailPresenter.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import UIKit
import MusicAPI

//protocol DetailPresenterProtocol {
//    var view: DetailViewProtocol? { get set }
//    var interactor: DetailInteractorProtocol? { get set }
//    var router: DetailRouterProtocol? { get set }
//    var musicResult: MusicResult? { get set }
//
//    func viewDidLoad()
//    func playButtonTapped()
//}
//
//class DetailPresenter: DetailPresenterProtocol {
//    weak var view: DetailViewProtocol?
//    var interactor: DetailInteractorProtocol?
//    var router: DetailRouterProtocol?
//    var musicResult: MusicResult?
//
//    func viewDidLoad() {
//        guard let musicResult = musicResult else { return }
//        view?.configureView(with: musicResult)
//    }
//
//    func playButtonTapped() {
//        // Handle play button tap event
//    }
//}

protocol DetailPresenterProtocol {
    func viewDidLoad()
}

extension DetailPresenter {
    fileprivate enum Constants {
        static let pageTitle: String = "Detail"
    }
}

final class DetailPresenter {
    
    unowned var view: DetailViewControllerProtocol!
    //let router: DetailRouterProtocol!
    init(
        view: DetailViewControllerProtocol
        //router: DetailRouterProtocol
    ) {
        self.view = view
        //self.router = router
    }
    
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func viewDidLoad() {
    
        guard let music = view.getSource() else { return }
        
//        ImageDownloader.shared.image(
//            news: news,
//            format: .superJumbo)
//        { [weak self] data, error in
//            guard let self else { return }
//            guard let data, error == nil else { return }
//            guard let image = UIImage(data: data) else { return }
//            self.view.setNewsImage(image)
//        }
        
        
        //view.setTitle(Constants.pageTitle)
        view.setArtistName(music.artistName ?? "")
        view.setTrackCount(music.trackCount.map(String.init) ?? "" )
        view.trackName(music.trackName ?? "")
        view.genreName(music.primaryGenreName ?? "")

    }
    
    
}
