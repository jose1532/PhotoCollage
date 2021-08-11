//
//  UICollectionView+EmptyState.swift
//  PhotoGrid
//
//  Created by everis on 11/08/21.
//

import Foundation
import UIKit

extension UICollectionView {

    func setEmptyMessage(_ message: String,
                         action: UIAction) {
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
//        container.backgroundColor = UIColor.red
        self.backgroundView = container
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        messageLabel.sizeToFit()
//        messageLabel.backgroundColor = UIColor.green

        container.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 0).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 0).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("Volver a intentar", for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor(named: "Primary")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.setTitleColor(UIColor(named: "Primary"), for: .normal)
        button.addAction(action, for: .touchUpInside)
        container.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40).isActive = true
        button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16).isActive = true
        
        

    }
    
    func restore() {
        self.backgroundView = nil
    }
}
