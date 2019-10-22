//
//  SelectImageVC.swift
//  instagramClone
//
//  Created by Levit Kanner on 10/10/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import UIKit

class SelectImageVC : UICollectionViewController, UICollectionViewDelegateFlowLayout , SelectImageDelegate {
  
    //Mark: - Properties
    private let reusableIdentifier = "cell"
    private let headerIdentifier = "header"
    
    //Mark: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //register collection view cell
        self.collectionView.register(SelectPhotoCell.self, forCellWithReuseIdentifier: reusableIdentifier)
        self.collectionView.register(SelectPhotoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        collectionView.backgroundColor = .white
        
        //Configure Navigation buttons
        configureNavigationButtons()
    }
    
    
     
    
    //Mark: -UIcollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    
    
    
    //Mark: - UIcollectionViewFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 6) / 4
        return CGSize(width: width, height: width)
    }
    
    //Cell Spacing. Minimum Interim Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    
    
    
    //Mark: - Cell Configuration
    //Configure Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as! SelectPhotoCell
        return cell
    }
    
    // Configure Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! SelectPhotoHeader
        
        return header
    }
    
    //Mark: - Delegate 
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil )
      }
    @objc func handleNext() {
        let uploadImageController = uploadPostVC()
        navigationController?.pushViewController(uploadImageController, animated: true)
    }
    
    //Mark: - Handlers
    func configureNavigationButtons ( ){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNext))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
     
}
