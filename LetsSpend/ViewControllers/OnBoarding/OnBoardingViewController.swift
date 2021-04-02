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
        
        let share = Core.shared
        
        if share.isNewUser(){
            SetupCollectionView()
            share.isNotNewUser()
        }else{
            showMainApp()
        }
    }
    
    
    private func SetupCollectionView(){
        
        let Layout = UICollectionViewFlowLayout()
        Layout.scrollDirection = .vertical
        CollectionView.contentInsetAdjustmentBehavior = .never // whiteSpace აშორებს ზევით
        CollectionView.collectionViewLayout = Layout
        CollectionView.isPagingEnabled = true
        CollectionView.showsVerticalScrollIndicator = false
        CollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func  handleActionButtonTap(at indexPath: IndexPath){
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
           let window = sceneDelegate.window {
            
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! OnBoardingCollectionViewCell
        
        let slide = slides[indexPath.row]
        
        cell.configure(with: slide)
        
        cell.actionButtonDidTap = { [weak self] in
            
            self?.handleActionButtonTap(at: indexPath)
            
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemwidth = collectionView.bounds.width
        let itemheight = collectionView.bounds.height
        
        return CGSize(width: itemwidth, height: itemheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
}


class OnBoardingCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var actionButtonDidTap: (() -> Void)?
    
    func configure(with slide: Slide){
        titleLabel.text = slide.title
        
        actionButton.backgroundColor = slide.buttonColor
        actionButton.setTitle(slide.buttonTitle, for: .normal)
        
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
