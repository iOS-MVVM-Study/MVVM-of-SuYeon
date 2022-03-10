//
//  ImageUploader.swift
//  InstagramFirestoreTutorial
//
//  Created by 김수연 on 2022/03/03.
//

//ImageUploader

import FirebaseStorage
import Foundation
import UIKit

struct ImageUploader {
    //파베 스토리지에 업로드
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")

        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }

            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
