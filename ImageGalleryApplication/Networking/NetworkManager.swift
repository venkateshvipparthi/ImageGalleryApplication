//
//  NetworkManager.swift
//  ImageGalleryApplication
//
//  Created by Admin on 22/04/2022.
//

import Foundation

protocol Networkable {
    var delegateViewModel: ImageGalleryViewModelType? {get set}
    func doApiCall(search: String)
}

class NetworkManager: Networkable {
    
    weak var delegateViewModel: ImageGalleryViewModelType?
    var photoData: [Photo] = []
    
    func doApiCall(search: String) {
        
        let urlstr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e08e76eff544231b992197c7c7c22a9&text=\(search)&format=json&nojsoncallback=1"
        
        let url = URL(string: urlstr)
        
        guard url != nil else  {
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) {
            data, responce, error in
        
            guard let data = data else {
                return
            }

            let decoded = JSONDecoder()
            do{
                let photosDetails = try decoded.decode(Pictures.self, from: data)
                self.photoData = photosDetails.photos.photo
               
                
                self.delegateViewModel?.updateImageResponce(responce: photosDetails)
                            
            }catch{
                print(error.localizedDescription)
            }
            
        }
        datatask.resume()
    }

    }
