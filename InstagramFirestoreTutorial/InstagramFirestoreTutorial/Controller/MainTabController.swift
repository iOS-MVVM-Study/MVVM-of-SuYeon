//
//  MainTabController.swift
//  InstagramFirestoreTutorial
//
//  Created by 김수연 on 2022/02/17.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        // anything that happens once the view loaded gets put inside of this func.
        super.viewDidLoad()
        configureViewController()
        checkIfUserIsLoggedIn()
    }

    // MARK: - API

    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            /// 메인쓰레드에서 비동기적으로
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Helpers

    func configureViewController() {

        // UICollectionViewController는 인자로 layout을 가지고 있어야함 .
        let layout = UICollectionViewFlowLayout()

        let feed = templateNavigationController(unselectedImage: UIImage(named: "home_unselected"), selectedImage: UIImage(named: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))

        let search = templateNavigationController(unselectedImage: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"), rootViewController: SearchController())

        let imageSelector = templateNavigationController(unselectedImage: UIImage(named: "plus_unselected"), selectedImage: UIImage(named: "plus_unselected"), rootViewController: ImageSelectorController())

        let notifications = templateNavigationController(unselectedImage: UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"), rootViewController: NotificationController())

        let profile = templateNavigationController(unselectedImage: UIImage(named: "profile_unselected"), selectedImage: UIImage(named: "profile_selected"), rootViewController: ProfileController())

        // UITabBarController inherit : An array of the root view controllers displayed by the tab bar interface
        // represents an instance of the controller
        viewControllers = [feed, search, imageSelector, notifications, profile]

        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        // tabbar 불투명하게 
        tabBar.isTranslucent = false
    }

    // 모든 탭에 대하여 각각 rootViewController로 설정하는 navigationcontroller을 생성하는 함수 !
    func templateNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.backgroundColor = .white
        return nav
    }

}
