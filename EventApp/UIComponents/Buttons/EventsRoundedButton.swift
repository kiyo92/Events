//
//  EventsRoundedButton.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 18/12/21.
//

import UIKit

class EventsRoundedButton: UIView {
    
    enum RoundedButtonType {
        case primary
        case secondary
        case outlined
        case notification
    }
    
    var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var notificationDot: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var notificationDotOutline: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    var icon: UIImage = UIImage()
    
    var buttonColor: UIColor = .white
    
    var buttonType: RoundedButtonType = .primary {
        didSet {
            setupStyle()
        }
    }
    
    var hasNotification: Bool = false {
        didSet {
            notificationDotOutline.isHidden = !hasNotification
            
        }
    }
    
    override var bounds: CGRect {
        didSet {
            setupStyle()
        }
    }
    
    init (color: UIColor, type: RoundedButtonType, icon: UIImage){
        super.init(frame: .zero)
        self.buttonColor = color
        self.buttonType = type
        self.icon = icon
        setup()
        setupStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        
        addSubview(button)
        addSubview(notificationDotOutline)
        notificationDotOutline.addSubview(notificationDot)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            notificationDotOutline.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2),
            notificationDotOutline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 3),
            notificationDotOutline.heightAnchor.constraint(equalToConstant: 15),
            notificationDotOutline.widthAnchor.constraint(equalToConstant: 15),
            
            notificationDot.bottomAnchor.constraint(equalTo: notificationDotOutline.bottomAnchor, constant: -1),
            notificationDot.trailingAnchor.constraint(equalTo: notificationDotOutline.trailingAnchor, constant: -1),
            notificationDot.leadingAnchor.constraint(equalTo: notificationDotOutline.leadingAnchor, constant: 1),
            notificationDot.topAnchor.constraint(equalTo: notificationDotOutline.topAnchor, constant: 1),
            
        ])
        
    }
    
    private func setPrimaryStyle(){
        button.backgroundColor = buttonColor
        button.tintColor = .white
        button.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setSecondaryStyle(){
        button.backgroundColor = .white
        button.tintColor = buttonColor
        button.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setOutlinedStyle(){
        button.backgroundColor = .clear
        button.tintColor = buttonColor
        button.layer.borderColor = buttonColor.cgColor
        button.layer.borderWidth = 2
    }
    
    private func setNotificationStyle(){
        
        setPrimaryStyle()
        
        notificationDotOutline.isUserInteractionEnabled = false
        notificationDotOutline.backgroundColor = .clear
        notificationDotOutline.layer.cornerRadius = 7.5
        notificationDotOutline.layer.borderColor = UIColor(hex: "#F7F5F2").cgColor
        notificationDotOutline.layer.borderWidth = 2.5
        
        notificationDot.layer.backgroundColor = UIColor.red.cgColor
        notificationDot.layer.cornerRadius = 6
    }
    
    private func setupStyle(){
        
        button.setImage(icon, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = bounds.width / 2
        
        switch buttonType {
        case .primary:
            setPrimaryStyle()
        case .secondary:
            setSecondaryStyle()
        case .outlined:
            setOutlinedStyle()
        case .notification:
            break
        }
    }
}
