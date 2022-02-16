//
//  MainTabController.swift
//  InstagramFirestoreTutorial
//
//  Created by 김수연 on 2022/02/17.
//

import UIKit

class MainTabController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        // anything that happens once the view loaded gets put inside of this func.
        super.viewDidLoad()
        configureViewController()
    }

    // MARK: - Helpers

    func configureViewController() {

        let feed = FeedController()

        let search = SearchController()

        let imageSelector = ImageSelectorController()

        let notification = NotificationController()

        let profile = ProfileController()

        // UITabBarController inherit : An array of the root view controllers displayed by the tab bar interface
        // represents an instance of the controller
        viewControllers = [feed, search, imageSelector, notification, profile]

        tabBar.backgroundColor = .white

    }

}
