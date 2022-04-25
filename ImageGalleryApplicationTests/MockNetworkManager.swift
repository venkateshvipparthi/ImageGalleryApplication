//
//  MockNetworkManager.swift
//  ImageGalleryApplicationTests
//
//  Created by Admin on 25/04/2022.
//

import Foundation
@testable import ImageGalleryApplication

class MockNetworkManager: Networkable {
   weak var delegateViewModel: ImageGalleryViewModelType?
    
    func doApiCall(search: String) {
        let bundle = Bundle(for: MockNetworkManager.self)
        
        guard let url =  bundle.url(forResource: "SearchSuccessResponce", withExtension:".json") else  {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoded = JSONDecoder()
            do{
                let photosDetails = try decoded.decode(Pictures.self, from: data)

                self.delegateViewModel?.updateImageResponce(responce: photosDetails)

            }catch{
                print(error.localizedDescription)

            }
        }catch {
            
        }
       
    }
    
    
    
    
}
