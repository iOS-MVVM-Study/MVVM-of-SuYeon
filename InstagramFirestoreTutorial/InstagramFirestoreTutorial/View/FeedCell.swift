//
//  FeedCell.swift
//  InstagramFirestoreTutorial
//
//  Created by 김수연 on 2022/02/17.
//

import UIKit

class FeedCell: UICollectionViewCell {

    // MARK: - Properties

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
