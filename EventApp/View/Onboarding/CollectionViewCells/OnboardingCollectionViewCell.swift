//
//  OnboardingCollectionViewCell.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 18/12/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static var identifier = "OnboardingCollectionViewCell"
    
    private lazy var titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageTitle: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "event-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "EventIO"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onboarding-image1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vehicula bibendum metus eu dictum."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.numberOfPages = 2
        return pageControl
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    func setData(image: UIImage, description: String, pageIndex: Int){
        descriptionLabel.text = description
        mainImage.image = image
        pageControl.currentPage = pageIndex
    }

    func setup(){
        contentView.addSubview(titleContainer)
        titleContainer.addSubview(imageTitle)
        titleContainer.addSubview(titleLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(pageControl)
        contentView.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            titleContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            titleContainer.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleContainer.heightAnchor.constraint(equalToConstant: 30),
            
            imageTitle.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 0),
            imageTitle.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor, constant: 0),
            imageTitle.heightAnchor.constraint(equalToConstant: 30),
            imageTitle.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageTitle.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor, constant: 0),
            
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            mainImage.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 60),
            mainImage.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 40),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            descriptionLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 40),
            
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            pageControl.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            
            continueButton.widthAnchor.constraint(equalToConstant: 120),
            continueButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            continueButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 40),
            continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
            
            
        ])
        
    }
}
