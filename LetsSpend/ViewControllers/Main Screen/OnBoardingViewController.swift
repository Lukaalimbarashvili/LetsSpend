//
//  OnBoardingViewController.swift
//  LetsSpend
//
//  Created by Ucha Dzotsenidze on 02.04.21.
//

import UIKit
import Lottie


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
        CollectionView.contentInsetAdjustmentBehavior = .never
        CollectionView.collectionViewLayout = Layout
        CollectionView.isPagingEnabled = true
        CollectionView.showsVerticalScrollIndicator = false
        CollectionView.showsHorizontalScrollIndicator = false
        
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
       
    }
    
    private func handleActionButtonDidTap(at indexPath: IndexPath){
        if indexPath.item == slides.count - 1{
            showMainApp()
        }else{
            let nextItem = indexPath.item + 1
            let nextIndexPath = IndexPath(item: nextItem, section: 0)
            CollectionView.scrollToItem(at: nextIndexPath, at: .top, animated: true)
        }
    }
    
    private func showMainApp(){
        let mainAppViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainStoryboard")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window{
            
            window.rootViewController = mainAppViewController
            
            UIView.transition(with: window,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
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
            self?.handleActionButtonDidTap(at: indexPath)
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = CollectionView.bounds.width
        let itemHeight = CollectionView.bounds.height
        
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


class OnBoardingControllerViewCell: UICollectionViewCell{
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var actionButtonDidTap: (() -> Void)?
    
    func Configure(with slide: Slide){
        
        pageTitle.text = slide.title
        
        nextButton.backgroundColor = slide.buttonColor
        nextButton.setTitle(slide.buttonTitle, for: .normal)
        
        let animation = Animation.named(slide.animationName)
        
        animationView.animation = animation
        
        animationView.loopMode = .loop
        
        if !animationView.isAnimationPlaying{
            animationView.play()
        }
        
    }
    
    @IBAction func actionButtonTapped(){
        actionButtonDidTap?()
    }
    
    
}
