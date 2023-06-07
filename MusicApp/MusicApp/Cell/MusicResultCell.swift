//
//  MusicResultCell.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import UIKit
import MusicAPI

class MusicResultCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with musicResult: MusicResult) {
        artistName.text = musicResult.trackName
        trackName.text = musicResult.artistName
        
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
