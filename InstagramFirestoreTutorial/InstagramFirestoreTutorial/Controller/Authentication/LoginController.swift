//
//  LoginController.swift
//  InstagramFirestoreTutorial
//
//  Created by 김수연 on 2022/02/24.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - Properties

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white

        navigationController?.navigationBar.isHidden = true

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
