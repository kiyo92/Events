//
//  HomeHighlightCollectionViewCell.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 18/12/21.
//

import UIKit

class HomeHighlightCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "HomeHighlightCollectionViewCell"
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "missing-image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var favoriteButton: EventsRoundedButton = {
        let button = EventsRoundedButton(color: .orange, type: .primary, icon: UIImage(systemName: "suit.heart") ?? UIImage())

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var infoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var infoTitle: UILabel = {
        let label = UILabel()
        label.text = "Super evento em Maceió"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var infoSubtitle: UILabel = {
        let label = UILabel()
        label.text = "Descricão do mega evento em Maceió"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var infoPrice: UILabel = {
        let label = UILabel()
        label.text = "R$ 120,00"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupData(title: String, price: Double, imageUrl: String){
        self.infoTitle.text = title
        self.infoPrice.text = "R$ \(price)".replacingOccurrences(of: ".", with: ",")
        self.backgroundImage.downloaded(from: imageUrl)
    }
    
    func setup(){
        
        contentView.addSubview(container)
        container.addSubview(backgroundImage)
        container.addSubview(favoriteButton)
        container.addSubview(infoContainer)
        infoContainer.addSubview(infoTitle)
        infoContainer.addSubview(infoSubtitle)
        infoContainer.addSubview(infoPrice)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            backgroundImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            backgroundImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0),
            
            favoriteButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
            favoriteButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            
            infoContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15),
            infoContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
            infoContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            infoContainer.heightAnchor.constraint(equalToConstant: 90),
            
            infoTitle.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 15),
            infoTitle.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor, constant: -15),
            infoTitle.topAnchor.constraint(equalTo: infoContainer.topAnchor, constant: 10),
            
            infoSubtitle.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 15),
            infoSubtitle.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor, constant: -15),
            infoSubtitle.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 5),
            
            infoPrice.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 15),
            infoPrice.trailingAnchor.constraint(equalTo: infoContainer.centerXAnchor, constant: 0),
            infoPrice.topAnchor.constraint(equalTo: infoSubtitle.bottomAnchor, constant: 10),
            
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.infoTitle.text = ""
        self.infoPrice.text = ""
        self.backgroundImage.image = UIImage(named: "missing-image")

    }
}
