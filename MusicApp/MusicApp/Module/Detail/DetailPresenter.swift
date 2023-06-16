
import UIKit
import MusicAPI
import AVFoundation
import CoreData

protocol DetailPresenterProtocol {
    func viewDidLoad()
    func playButtonTapped()
    func favButtonTapped(trackName: String?)
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
    func favButtonTapped(trackName: String?) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let trackName = trackName else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavMusics")
        fetchRequest.predicate = NSPredicate(format: "trackName == %@", trackName)
        
        do {
            let result = try context.fetch(fetchRequest)
            
            if let favMusic = result.first as? NSManagedObject {
                context.delete(favMusic)
                print("Track name removed from favorites: \(trackName)")
                view?.favButton.setImage(UIImage(systemName: "heart"), for: .normal)

            } else {
                let entity = NSEntityDescription.entity(forEntityName: "FavMusics", in: context)
                let favMusic = NSManagedObject(entity: entity!, insertInto: context)
                favMusic.setValue(trackName, forKey: "trackName")
                print("Track name added to favorites: \(trackName)")
                view?.favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            
            try context.save()
        } catch {
            print("Failed to update favorite track name: \(error)")
        }
    }
    
    func isFavorite(trackName: String) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavMusics")
        fetchRequest.predicate = NSPredicate(format: "trackName == %@", trackName)
        
        do {
            let result = try context.fetch(fetchRequest)
            return !result.isEmpty
        } catch {
            print("Failed to fetch favorite track: \(error)")
            return false
        }
    }
     
    func playButtonTapped() {
        guard let musicResult = view.getSource() else {
            return
        }
        
        if let previewUrlString = musicResult.previewUrl, let previewUrl = URL(string: previewUrlString) {
            if let player = player, player.isPlaying {
                player.stop()
                view?.playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            } else {
                playAudioFromURL(previewUrl)
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
                    self?.view.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
                } catch {
                    print("Failed to play audio: \(error)")
                }
            }
        }
        task.resume()
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        view.playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    
    func viewDidLoad() {
        guard let music = view.getSource(),
              let imageUrlString = music.artworkUrl100,
              let imageUrl = URL(string: imageUrlString),
              let trackName = music.trackName else {
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
        
        view.setArtistName(music.artistName ?? "")
        view.setTrackCount(music.trackCount.map(String.init) ?? "" )
        view.trackName(music.trackName ?? "")
        view.genreName(music.primaryGenreName ?? "")

        let isFavorite = isFavorite(trackName: trackName)
        
        if isFavorite {
            view.favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            view.favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }   
}

