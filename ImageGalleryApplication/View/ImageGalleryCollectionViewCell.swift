//
//  ImageGalleryCollectionViewCell.swift
//  ImageGalleryApplication
//
//  Created by Admin on 22/04/2022.
//

import UIKit

class ImageGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgDesc: UILabel!
    @IBOutlet weak var galleryImage: UIImageView!
    
    func setData(_ photoDetail: Photo) {
        imgDesc.text = photoDetail.title
    }
    
}
