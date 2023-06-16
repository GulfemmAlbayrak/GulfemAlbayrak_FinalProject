//
//  LoadingView.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 8.06.2023.
//

import UIKit

class LoadingView {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let shared = LoadingView()
    var blurView: UIVisualEffectView = UIVisualEffectView()

    private init() {
        configure()
    }

    func configure() {
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.frame = UIWindow(frame: UIScreen.main.bounds).frame
        activityIndicator.center = blurView.center
        activityIndicator.hidesWhenStopped = true
        blurView.contentView.addSubview(activityIndicator)
    }

    func startLoading() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let mainWindow = windowScene.windows.first else {
                return
        }

        mainWindow.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.blurView.removeFromSuperview()
            self.activityIndicator.stopAnimating()
        }
    }
}
/*

 class LoadingView {
     var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
     static let shared = LoadingView()
     var blurView: UIVisualEffectView = UIVisualEffectView()
     private var tableView: UITableView?
     
     private init() {
         configure()
     }
     
     func configure() {
         guard let tableView = tableView else {
             return
         }
         
         blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
         blurView.translatesAutoresizingMaskIntoConstraints = false
         activityIndicator.hidesWhenStopped = true
         blurView.contentView.addSubview(activityIndicator)
         
         NSLayoutConstraint.activate([
             blurView.topAnchor.constraint(equalTo: tableView.topAnchor),
             blurView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
             blurView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
             blurView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
         ])
     }
     
     func configure(tableView: UITableView) {
         self.tableView = tableView
         configure()
     }
     
     func startLoading() {
         guard let tableView = tableView else {
             return
         }
         
         tableView.addSubview(blurView)
         activityIndicator.center = blurView.center
         activityIndicator.startAnimating()
     }
     
     func hideLoading() {
         DispatchQueue.main.async {
             self.blurView.removeFromSuperview()
             self.activityIndicator.stopAnimating()
         }
     }
 }
 */
