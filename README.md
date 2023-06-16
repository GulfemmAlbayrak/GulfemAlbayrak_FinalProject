# iTunesAPP

### iTunesAPP is a music application that utilizes the [iTunesAPI](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html)   to fetch music data. The application provides various features for searching and playing music, as well as managing favorites using CoreData. 

## Features
- **Internet Connectivity Check:**  The application checks for internet connectivity before proceeding. If there is an active internet connection, the main screen functions properly.
- **Search Bar:**  Users can enter a search query in the search bar to retrieve music data from the iTunes API.
- **Music Playback:**The application allows users to play music by tapping the "Play" button in each cell. The AVAudioPlayer library is used to download and cache music files, providing an easy way to play songs from URLs obtained from the iTunes API.
- **Detail View:** Users can navigate to the detail view by tapping on a cell, where they can access more information about the selected song.
- **Play Music in Detail View:** Users can play the selected song within the detail view by tapping the "Play" button.
- **Favorites Management:** he application incorporates CoreData to enable data persistence for managing favorite songs. Users can add or remove songs from their favorites list within the detail view.
- **VIPER Architecture:** The project is organized using the VIPER architectural pattern, which promotes separation of concerns and testability. 

## Dependencies
- Alamofire: A networking library used for making API requests to the iTunes API.
- AVAudioPlayer: Used for downloading and caching music files. It provides an easy way to play songs from URLs obtained from the iTunes API.
- CoreData: Enables data persistence for saving favorite songs and managing them within the application.

## Testing
- Unit Tests: Unit tests are written for each VIPER component (Interactor, Presenter, Router) to ensure their functionality and test them in isolation. Mocking frameworks can be used to mock dependencies.
- UI Tests: UI tests are written using XCTest framework to test the end-to-end flow of the application. These tests cover scenarios like searching for music, adding/removing favorites, and navigating between screens.


 ## Media

| SearchVC                     | DetailVC                   | 
| ---------------------------- | -------------------------- | 
| <img src="https://github.com/GulfemmAlbayrak/GulfemAlbayrak_FinalProject/assets/101430350/6aba445d-44bc-4307-9af3-6d18e6594843" width="300px"> | <img src="https://github.com/GulfemmAlbayrak/GulfemAlbayrak_FinalProject/assets/101430350/688580df-5bf1-4e70-ac23-f1a7ff2da60f" width="300px"> |

## Video

|                              |     
| ---------------------------- | 
| <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMG1zdXE5bjI1cjJ6NWFxODJnd3F0MWd2dHV0dHRqM3ZnNHVlbjh6YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/EI7FS4XcSowAdBSekn/giphy.gif" width="300px"> |

