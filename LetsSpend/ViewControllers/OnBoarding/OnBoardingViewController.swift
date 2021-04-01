//
//  OnBoardingViewController.swift
//  LetsSpend
//
//  Created by Ucha Dzotsenidze on 02.04.21.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    private let slides: [Slide] = Slide.collection

    override func viewDidLoad() {
        super.viewDidLoad()

        SetupCollectionView()
    }
    
    
    private func SetupCollectionView(){
        let Layout = UICollectionViewFlowLayout()
        Layout.scrollDirection = .vertical
        CollectionView.contentInsetAdjustmentBehavior = .never // whiteSpace აშორებს ზევით
        CollectionView.collectionViewLayout = Layout
        CollectionView.isPagingEnabled = true
        CollectionView.showsVerticalScrollIndicator = false
        CollectionView.showsHorizontalScrollIndicator = false
        
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
       
    }
    
    private func handleActionButtonDidTap(at indexPath: IndexPath){
        
    }
    
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as! OnBoardingControllerViewCell
        
        let slide = slides[indexPath.row]
        
        cell.Configure(with: slide)
        
        cell.actionButtonDidTap = { [weak self] in
            
            
            
            
        }
        
        return cell
        
    }
    
    
}


class OnBoardingControllerViewCell: UICollectionViewCell{
    
    
    
    var actionButtonDidTap: (() -> Void)?
    
    func Configure(with slide: Slide){
        
    }
    
    
    
    
}
