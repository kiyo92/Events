//
//  HomeActionCollectionViewCell.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 18/12/21.
//

import UIKit

class HomeActionCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "HomeActionCollectionViewCell"
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var actionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "event-logo")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var actionTitle: UILabel = {
        let label = UILabel()
        label.text = "Favoritos"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func setup(){
        contentView.addSubview(container)
        container.addSubview(actionIcon)
        contentView.addSubview(actionTitle)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            actionIcon.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15),
            actionIcon.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
            actionIcon.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            actionIcon.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            
            actionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            actionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            actionTitle.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            actionTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            actionTitle.heightAnchor.constraint(equalToConstant: 15)
            
        ])
        
    }
    
}
