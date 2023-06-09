//
//  DetailPresenter.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import UIKit
import MusicAPI

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

