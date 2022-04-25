//
//  ImageGalleryViewModel.swift
//  ImageGalleryApplication
//
//  Created by Admin on 22/04/2022.
//

import Foundation

protocol ImageGalleryViewModelType:AnyObject {
    func updateImageResponce(responce: Pictures)
    var photoDetailsCount:Int { get }
}

class ImageGalleryViewModel: ImageGalleryViewModelType {
   
    weak var delegate: Result?
    var networkManager: Networkable = NetworkManager()
    
    init(delegate: Result){
        self.delegate = delegate
    }
    var photoDetailsCount: Int {
        return photoRecords.count
    }
  
    var photoRecords: [Photo] = []
    
    func getImage(search: String) {
        networkManager.delegateViewModel = self
        
        networkManager.doApiCall(search: search)
        }

    func updateImageResponce(responce: Pictures) {
        self.photoRecords = responce.photos.photo
          DispatchQueue.main.async {
              self.delegate?.getFinalResult()
      }
    }
    
    
    
}
