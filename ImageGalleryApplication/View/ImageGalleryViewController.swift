//
//  ViewController.swift
//  ImageGalleryApplication
//
//  Created by Admin on 22/04/2022.
//

import UIKit

class ImageGalleryViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectinonView: UICollectionView!
    
    var viewModel: ImageGalleryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectinonView.dataSource = self
        collectinonView.delegate = self
        
        viewModel = ImageGalleryViewModel(delegate: self)
        viewModel.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            if let text = searchBar.text {
                viewModel.getImage(search: text)
            }
        }
}

extension ImageGalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.photoDetailsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageGalleryCollectionViewCell

        Cell.setData(viewModel.photoRecords[indexPath.row])
                    
        let user = viewModel.photoRecords[indexPath.row]
        
        let farmValue = user.farm
        let server = user.server
        let id = user.id
        let secretValue = user.secret
        
        let imageReturnedURL = "https://farm\(farmValue).staticflickr.com/\(server)/\(id)_\(secretValue)_m.jpg"
        
        Cell.galleryImage.downLoadImage(owner: imageReturnedURL)
        return Cell
    }
    
}

protocol Result: AnyObject{
    
    func getFinalResult()
}

extension ImageGalleryViewController: Result{
    
    func getFinalResult() {
        DispatchQueue.main.async {
            self.collectinonView.reloadData()
            
        }
    }
}


