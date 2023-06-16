//
//  MusicResultCell.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import UIKit
import MusicAPI
import AVFoundation

class MusicResultCell: UITableViewCell, AVAudioPlayerDelegate {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var musicResult: MusicResult?
    var player: AVAudioPlayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
    @IBAction func playButtonTapped(_ sender: Any) {
        guard let musicResult = musicResult else {
            return 
        }
        
        if let previewUrlString = musicResult.previewUrl, let previewUrl = URL(string: previewUrlString) {
            if let player = player, player.isPlaying {
                player.stop()
                playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
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
                    self?.player?.delegate = self
                    self?.player?.prepareToPlay()
                    self?.player?.play()
                    self?.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
                } catch {
                    print("Failed to play audio: \(error)")
                }
            }
        }
        
        task.resume()
    }
        
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    
    func configure(with musicResult: MusicResult) {
        musicImage.layer.cornerRadius = 5
        musicImage.layer.masksToBounds = true
        
        artistName.text = musicResult.trackName
        trackName.text = musicResult.artistName
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        if let trackCount = musicResult.trackCount {
            trackCountLabel.text = "Count: \(trackCount)"
        } else {
            trackCountLabel.text = "Count: Unknown"
        }
        
        if let imageUrlString = musicResult.artworkUrl100, let imageUrl = URL(string: imageUrlString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl) {
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.musicImage.image = image
                    }
                }
            }
        }
    } 
}
