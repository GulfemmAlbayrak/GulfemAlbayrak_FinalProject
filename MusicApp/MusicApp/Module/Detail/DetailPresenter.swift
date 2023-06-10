//
//  DetailPresenter.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import UIKit
import MusicAPI
import AVFoundation

protocol DetailPresenterProtocol {
    func viewDidLoad()
    func playButtonTapped()
}

extension DetailPresenter {
    fileprivate enum Constants {
        static let pageTitle: String = "Detail"
    }
}

final class DetailPresenter {
    var player: AVAudioPlayer?
    weak var view: DetailViewControllerProtocol!

    init(
        view: DetailViewControllerProtocol

    ) {
        self.view = view
    }
    
}

extension DetailPresenter: DetailPresenterProtocol {
    func playButtonTapped() {
        guard let musicResult = view.getSource() else {
            return
        }
        
        if let previewUrlString = musicResult.previewUrl, let previewUrl = URL(string: previewUrlString) {
            if let player = player, player.isPlaying {
                player.stop()
                //playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            } else {
                playAudioFromURL(previewUrl)
                // İlgili buton görüntüsünü güncelleyin
            }
        }
    }
    private func playAudioFromURL(_ audioURL: URL) {
            let session = URLSession.shared
            let request = URLRequest(url: audioURL)
            
            let task = session.dataTask(with: request) { [weak self] (data, response, error) in
                if let error = error {
                    print("Failed to play audio: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("Failed to get audio data")
                    return
                }
                
                DispatchQueue.main.async {
                    do {
                        self?.player = try AVAudioPlayer(data: data)
                        //self?.player?.delegate = self
                        self?.player?.prepareToPlay()
                        self?.player?.play()
                        //self?.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
                    } catch {
                        print("Failed to play audio: \(error)")
                    }
                }
            }
            
            task.resume()
        }
    
    
    func viewDidLoad() {
    
        guard let music = view.getSource(),
              let imageUrlString = music.artworkUrl100,
              let imageUrl = URL(string: imageUrlString) else {
            return
        }

        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.view.setImage(image)
                }
            }
        }

        
        //view.setImage(music.artworkUrl100 ?? "")
        view.setArtistName(music.artistName ?? "")
        view.setTrackCount(music.trackCount.map(String.init) ?? "" )
        view.trackName(music.trackName ?? "")
        view.genreName(music.primaryGenreName ?? "")

    }
    
    
}

