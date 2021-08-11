//
//  HeroViewCell.swift
//  PhotoGrid
//
//  Created by Nestor Silva on 10/08/21.
//

import UIKit
import Kingfisher

class HeroViewCell: UICollectionViewCell {
    
    var hero: Superhero? = nil {
        didSet {
            if let heroe = hero {
                if let url = URL(string: heroe.images.sm) {
                    imgHero.kf.setImage(with: url)
                    imgHero.contentMode = .scaleToFill
                }
                lbHerosName.text = "\(heroe.name)"
                lbHeroHeight.text = "Height: \(heroe.appearance.height[1])"
                lbHeroWeight.text = "Weight: \(heroe.appearance.weight[1])"
                
                viewBack.clipsToBounds = true
            }
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var lbHerosName: UILabel!
    @IBOutlet weak var lbHeroHeight: UILabel!
    @IBOutlet weak var lbHeroWeight: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgHero.layer.cornerRadius = UIConstants.borderRadius
//         let locations:[NSNumber] = [0.2,0.8]
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0).cgColor,
                                UIColor.black.cgColor]
        // gradientLayer.locations = locations
        viewBack.clipsToBounds = true
        gradientLayer.frame = viewBack.bounds
        
        viewBack.backgroundColor = UIColor.clear
        // viewBack.layer.addSublayer(gradientLayer)
        viewBack.layer.insertSublayer(gradientLayer, at: 0)
        viewBack.layer.cornerRadius = UIConstants.borderRadius
        
        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }

    override func layoutSubviews() {
        viewBack.clipsToBounds = true
        gradientLayer.frame = viewBack.bounds
    }
    
}
