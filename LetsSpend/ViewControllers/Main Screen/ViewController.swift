//
//  ViewController.swift
//  LetsSpend
//
//  Created by Luka Alimbarashvili on 02.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell",for: indexPath) as! ItemCell
//        cell.configure(movie: UIImage(named: "car")!)
//        cell.price.text = "300 000$"
        
        
        return cell
    }
    
}
