//
//  EventDetailViewController.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 22/12/21.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    private lazy var headerContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var backButton: EventsRoundedButton = {
        let button = EventsRoundedButton(color: .white, type: .outlined, icon: UIImage(systemName: "arrowshape.turn.up.backward.fill") ?? UIImage())
        button.button.addTarget(self, action: #selector(didBackPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "highlight-image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var mainDetailsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 1, height: -2)
        view.layer.shadowColor = UIColor.black.cgColor
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var mainDetailsTitle: UILabel = {
        let label = UILabel()
        label.text = "Super evento em Maceió"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainDetailsAddress: UILabel = {
        let label = UILabel()
        label.text = "Super evento em Maceió"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainDetailsDateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = .orange
        return imageView
    }()
    
    private lazy var mainDetailsDate: UILabel = {
        let label = UILabel()
        label.text = "Super evento em Maceió"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainDetailsPricingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "dollarsign.circle")
        imageView.tintColor = .orange
        return imageView
    }()
    
    private lazy var mainDetailsPricing: UILabel = {
        let label = UILabel()
        label.text = "Super evento em Maceió"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkoutContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var checkoutTitle: UILabel = {
        let label = UILabel()
        label.text = "Super evento em Maceió"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkoutFavoriteButton: EventsRoundedButton = {
        let button = EventsRoundedButton(color: .orange, type: .primary, icon: UIImage(systemName: "suit.heart") ?? UIImage())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var checkoutTitleSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F7F5F2")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var checkoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "highlight-image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    private lazy var checkoutPrice: UILabel = {
        let label = UILabel()
        label.text = "R$ 0,00"
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stepper: EventsStepper = EventsStepper()
    
    private lazy var checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comprar", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F7F5F2")
        setup()
        // Do any additional setup after loading the view.
    }
    
    @objc func didBackPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    func setup(){
        
        view.addSubview(headerContainer)
        headerContainer.addSubview(headerImage)
        headerContainer.addSubview(backButton)
        view.addSubview(mainDetailsContainer)
        mainDetailsContainer.addSubview(mainDetailsTitle)
        mainDetailsContainer.addSubview(mainDetailsAddress)
        mainDetailsContainer.addSubview(mainDetailsDateImage)
        mainDetailsContainer.addSubview(mainDetailsDate)
        mainDetailsContainer.addSubview(mainDetailsPricingImage)
        mainDetailsContainer.addSubview(mainDetailsPricing)
        view.addSubview(checkoutContainer)
        checkoutContainer.addSubview(checkoutTitle)
        checkoutContainer.addSubview(checkoutFavoriteButton)
        checkoutContainer.addSubview(checkoutTitleSeparator)
        checkoutContainer.addSubview(checkoutImage)
        checkoutContainer.addSubview(checkoutPrice)
        checkoutContainer.addSubview(stepper)
        checkoutContainer.addSubview(checkoutButton)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            headerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerContainer.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
            
            headerImage.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 0),
            headerImage.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: 0),
            headerImage.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 0),
            headerImage.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 0),
            
            backButton.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            mainDetailsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainDetailsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            mainDetailsContainer.heightAnchor.constraint(equalToConstant: 100),
            mainDetailsContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -55),
            
            mainDetailsTitle.leadingAnchor.constraint(equalTo: mainDetailsContainer.leadingAnchor, constant: 15),
            mainDetailsTitle.trailingAnchor.constraint(equalTo: mainDetailsContainer.trailingAnchor, constant: -15),
            mainDetailsTitle.topAnchor.constraint(equalTo: mainDetailsContainer.topAnchor, constant: 15),
            
            mainDetailsAddress.leadingAnchor.constraint(equalTo: mainDetailsContainer.leadingAnchor, constant: 15),
            mainDetailsAddress.trailingAnchor.constraint(equalTo: mainDetailsContainer.trailingAnchor, constant: -15),
            mainDetailsAddress.topAnchor.constraint(equalTo: mainDetailsTitle.bottomAnchor, constant: 5),
            
            mainDetailsDateImage.leadingAnchor.constraint(equalTo: mainDetailsContainer.leadingAnchor, constant: 25),
            mainDetailsDateImage.topAnchor.constraint(equalTo: mainDetailsAddress.bottomAnchor, constant: 6),
            mainDetailsDateImage.widthAnchor.constraint(equalToConstant: 20),
            mainDetailsDateImage.heightAnchor.constraint(equalToConstant: 20),
            
            mainDetailsDate.leadingAnchor.constraint(equalTo: mainDetailsDateImage.trailingAnchor, constant: 5),
            mainDetailsDate.trailingAnchor.constraint(equalTo: mainDetailsContainer.centerXAnchor, constant: 0),
            mainDetailsDate.topAnchor.constraint(equalTo: mainDetailsAddress.bottomAnchor, constant: 8),
            
            mainDetailsPricingImage.leadingAnchor.constraint(equalTo: mainDetailsContainer.centerXAnchor, constant: 15),
            mainDetailsPricingImage.topAnchor.constraint(equalTo: mainDetailsAddress.bottomAnchor, constant: 6),
            mainDetailsPricingImage.widthAnchor.constraint(equalToConstant: 20),
            mainDetailsPricingImage.heightAnchor.constraint(equalToConstant: 20),
            
            mainDetailsPricing.leadingAnchor.constraint(equalTo: mainDetailsPricingImage.trailingAnchor, constant: 5),
            mainDetailsPricing.trailingAnchor.constraint(equalTo: mainDetailsContainer.trailingAnchor, constant: -25),
            mainDetailsPricing.topAnchor.constraint(equalTo: mainDetailsAddress.bottomAnchor, constant: 8),
            
            checkoutContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            checkoutContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            checkoutContainer.topAnchor.constraint(equalTo: mainDetailsContainer.bottomAnchor, constant: 20),
            checkoutContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            checkoutTitle.leadingAnchor.constraint(equalTo: checkoutContainer.leadingAnchor, constant: 20),
            checkoutTitle.topAnchor.constraint(equalTo: checkoutContainer.topAnchor, constant: 20),
            
            checkoutFavoriteButton.trailingAnchor.constraint(equalTo: checkoutContainer.trailingAnchor, constant: -20),
            checkoutFavoriteButton.topAnchor.constraint(equalTo: checkoutContainer.topAnchor, constant: 15),
            checkoutFavoriteButton.widthAnchor.constraint(equalToConstant: 30),
            checkoutFavoriteButton.heightAnchor.constraint(equalToConstant: 30),
            
            checkoutTitleSeparator.leadingAnchor.constraint(equalTo: checkoutContainer.leadingAnchor, constant: 20),
            checkoutTitleSeparator.topAnchor.constraint(equalTo: checkoutTitle.bottomAnchor, constant: 16),
            checkoutTitleSeparator.trailingAnchor.constraint(equalTo: checkoutContainer.trailingAnchor, constant: -20),
            checkoutTitleSeparator.heightAnchor.constraint(equalToConstant: 3),
            
            checkoutImage.leadingAnchor.constraint(equalTo: checkoutContainer.leadingAnchor, constant: 20),
            checkoutImage.topAnchor.constraint(equalTo: checkoutTitleSeparator.bottomAnchor, constant: 20),
            checkoutImage.widthAnchor.constraint(equalToConstant: 105),
            checkoutImage.heightAnchor.constraint(equalToConstant: 105),
            
            checkoutPrice.centerXAnchor.constraint(equalTo: stepper.centerXAnchor, constant: 0),
            checkoutPrice.topAnchor.constraint(equalTo: checkoutImage.topAnchor, constant: 16),
            
            stepper.trailingAnchor.constraint(equalTo: checkoutContainer.trailingAnchor, constant: -45),
            stepper.bottomAnchor.constraint(equalTo: checkoutImage.bottomAnchor, constant: 0),
            
            checkoutButton.leadingAnchor.constraint(equalTo: checkoutContainer.leadingAnchor, constant: 20),
            checkoutButton.trailingAnchor.constraint(equalTo: checkoutContainer.trailingAnchor, constant: -20),
            checkoutButton.bottomAnchor.constraint(equalTo: checkoutContainer.bottomAnchor, constant: -30),
            checkoutButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
}
