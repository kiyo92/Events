//
//  OnboardingViewController.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 18/12/21.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private var mainImages: [UIImage?] = [UIImage(named: "onboarding-image1"), UIImage(named: "onboarding-image2")]
    private var descriptions: [String] = [
        "Sejam bem-vindos ao EventIO, o app de evento que está revolucionando a sua experiência com eventos",
        "Com o EventIO você economizará em taxas de serviço e conveniência"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        setup()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setup() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
        ])
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
            
            return UICollectionViewCell()
        }

        cell.setData(image: mainImages[indexPath.item] ?? UIImage(), description: descriptions[indexPath.item], pageIndex: indexPath.item)
        cell.setup()
        cell.continueButton.addTarget(self, action: #selector(continueButtonPressed(sender: )), for: .touchUpInside)
        
        return cell
    }
    
    @objc func continueButtonPressed(sender: Any){
        
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            if (indexPath?.item ?? 0) < collectionView.numberOfItems(inSection: 0) - 1 {
                let nextIndexPath = IndexPath(item: (indexPath?.item ?? 0) + 1, section: 0)
                collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            } else {
                UserDefaults.standard.set(true, forKey: "launchedBefore")
                let vc = HomeViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    //Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
}
