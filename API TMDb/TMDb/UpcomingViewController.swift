//
//  UpcomingViewController.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/24/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController {
    let names = ["ssdsd","sdsd"]
    var index: Int = 0
    var upcomingMovies = [UpcomingMovie]()
    var viewModel: UpcomingViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let indicatorView = UIActivityIndicatorView(style: .gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupSubviews()
        setupConstraints()
        setupStyle()
        indicatorView.startAnimating()
        viewModel = UpcomingViewModel()
        viewModel?.fetchUpcomingMovies()
    }
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    func setupStyle() {
        collectionView.backgroundColor = .white
    }
    func setupSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UpcomingCollectionViewCell.self)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width)/3-10, height: (UIScreen.main.bounds.height)/4-10)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView.setCollectionViewLayout(layout, animated: true)
        view.addSubview(collectionView)
    }
}
extension UpcomingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingMovies.count
    }
    func collectionView(_ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UpcomingCollectionViewCell =
            collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let url = "https://image.tmdb.org/t/p/w500"
        guard let poster  = upcomingMovies[indexPath.row].posterPath else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        }
        let urlImage = url+poster
        guard let imageUrl = URL(string: urlImage) else { return UICollectionViewCell() }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return UICollectionViewCell() }
        var image = UIImage()
        if let data = imageData as? Data {
            image = UIImage(data: data) ?? UIImage()
        } else {
            image = UIImage()
        }
        cell.imageView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        let upmovieID = upcomingMovies[index].id
        let vc = DetailViewController()
        vc.movieID = upmovieID
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension UpcomingViewController: UpcomingViewModelDelegate {
    func performOnFetch(movies: [UpcomingMovie]) {
        DispatchQueue.main.async {
            self.upcomingMovies = movies
            self.collectionView.reloadData()
            self.indicatorView.stopAnimating()
        }
    }
    func performOnError(_ error: Error) {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
            let alertController = UIAlertController(title: "Ошибка",
                message: "Возникла проблема при загрузке данных",
                preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true)
        }
    }
}
