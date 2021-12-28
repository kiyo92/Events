//
//  HomeViewController.swift
//  EventApp
//
//  Created by Joao Marcus Dionisio Araujo on 18/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.hidesWhenStopped = true
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo, João"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var notificationButton: EventsRoundedButton = {
        let button = EventsRoundedButton(color: .orange, type: .primary, icon: UIImage(systemName: "suit.heart") ?? UIImage())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Confira as nossas funcionalidades"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var actionsCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeActionCollectionViewCell.self, forCellWithReuseIdentifier: HomeActionCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var highlightsLabel: UILabel = {
        let label = UILabel()
        label.text = "Eventos em destaque"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var highlightsCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeHighlightCollectionViewCell.self, forCellWithReuseIdentifier: HomeHighlightCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var viewModel: EventListViewModel = EventListViewModel()
    
    private var eventList: [EventModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionsCollectionView.delegate = self
        actionsCollectionView.dataSource = self
        highlightsCollectionView.delegate = self
        highlightsCollectionView.dataSource = self
        view.backgroundColor = UIColor(hex: "#F7F5F2")
        viewModel.delegate = self
        setup()
        viewModel.getEventList()
        loading.startAnimating()
    }

    func setup(){
        view.addSubview(titleLabel)
        view.addSubview(notificationButton)
        view.addSubview(subtitleLabel)
        view.addSubview(actionsCollectionView)
        view.addSubview(highlightsCollectionView)
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            notificationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            notificationButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            notificationButton.heightAnchor.constraint(equalToConstant: 30),
            notificationButton.widthAnchor.constraint(equalToConstant: 30),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            actionsCollectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            actionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            actionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            actionsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            highlightsCollectionView.topAnchor.constraint(equalTo: actionsCollectionView.bottomAnchor, constant: 20),
            highlightsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            highlightsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            highlightsCollectionView.heightAnchor.constraint(equalToConstant: view.bounds.width - 60),

        ])
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if(collectionView == self.actionsCollectionView){
            return 1
        } else if (collectionView == self.highlightsCollectionView) {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.actionsCollectionView){
            return 4
        } else if (collectionView == self.highlightsCollectionView) {
            return eventList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == self.actionsCollectionView){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeActionCollectionViewCell.identifier, for: indexPath) as? HomeActionCollectionViewCell else {
                
                return UICollectionViewCell()
            }

            cell.setup()
            
            return cell
        } else if (collectionView == self.highlightsCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHighlightCollectionViewCell.identifier, for: indexPath) as? HomeHighlightCollectionViewCell else {
                
                return UICollectionViewCell()
            }

            cell.setup()
            cell.setupData(title: eventList[indexPath.item].title ?? "", price: eventList[indexPath.item].price ?? 0, imageUrl: eventList[indexPath.item].image ?? "")
            
            return cell
        }
        
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == self.actionsCollectionView){
            return CGSize(width: 80, height: 100)
        } else if (collectionView == self.highlightsCollectionView) {
            return CGSize(width: view.bounds.width - 60, height: view.bounds.width - 60)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = EventDetailViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: EventListProtocol {
    func didGetData(events: [EventModel]) {
        eventList = events
        
        DispatchQueue.main.async {
            self.highlightsCollectionView.reloadData()
            self.loading.stopAnimating()
        }
    }
    
    func didError(error: String) {
        self.loading.stopAnimating()
        print(error)
    }
}
