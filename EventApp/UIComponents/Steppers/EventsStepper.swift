//
//  EventsStepper.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 28/12/21.
//

import UIKit

class EventsStepper: UIView {
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didMinusTapped), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.setTitle("-", for: .normal)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("+", for: .normal)
        return button
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var amount: Int = 0 {
        didSet {
            amountLabel.text = "\(amount)"
        }
    }

    init (){
        super.init(frame: .zero)
        setup()
        plusButton.addTarget(self, action: #selector(didPlusTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func didMinusTapped(){
        amount -= amount > 0 ? 1 : 0
    }
    
    @objc func didPlusTapped(){
        amount += 1
    }
    
    private func setup() {
        addSubview(minusButton)
        addSubview(amountLabel)
        addSubview(plusButton)
        
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            minusButton.heightAnchor.constraint(equalToConstant: 36),
            minusButton.widthAnchor.constraint(equalToConstant: 36),
            //amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: topAnchor),
            amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            amountLabel.widthAnchor.constraint(equalToConstant: 35),
            
            plusButton.topAnchor.constraint(equalTo: topAnchor),
            plusButton.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 10),
            plusButton.heightAnchor.constraint(equalToConstant: 36),
            plusButton.widthAnchor.constraint(equalToConstant: 36),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
}
