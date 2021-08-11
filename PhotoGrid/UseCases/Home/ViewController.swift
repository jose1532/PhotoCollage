//
//  ViewController.swift
//  PhotoGrid
//
//  Created by Nestor Silva on 9/08/21.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: [Superhero]?
    var progress = ProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
        loadHeroes()
    }

    func configCollection(){
        let nib = UINib(nibName: Constants.CellIdentifier.HeroViewCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.CellIdentifier.HeroViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func loadHeroes(){
        ProgressHUD.show()
        let repository = HeroesRepository()
        repository.getHeroes { (response) in
            ProgressHUD.dismiss()
            switch response {
            case .success(let dto):
                self.dataSource = dto
                self.collectionView.reloadData()
            case .failure(let error):
                self.dataSource = []
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = collectionView.frame.width
        let width = ((maxWidth)/2).rounded(.down) - 24
        let height = (width * 1.3 ).rounded(FloatingPointRoundingRule.awayFromZero)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.dataSource?.count == 0) {
            let action = UIAction { _ in
                self.loadHeroes()
            }
            collectionView.setEmptyMessage(Constants.TextMessages.emptyState,
                                           action: action)
        } else {
            self.collectionView.restore()
        }
        
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.HeroViewCell, for: indexPath) as! HeroViewCell
        if let items = dataSource {
            cell.hero = items[indexPath.row]
        }
        
        return cell
    }
    
    
}
