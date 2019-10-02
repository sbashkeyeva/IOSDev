//
//  MovieDetailViewController.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/26/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//
import UIKit


class DetailViewController: UIViewController {
    var viewModel: DetailViewModelProtocol? {
        didSet { viewModel?.delegate = self }
    }
    var movieID : Int?
    let label = UILabel()
    let overviewLabel = UILabel()
    let imageView = UIImageView()
    let seeButton = UIButton()
    var upmovie = [UpmovieDetail]()
    let string : String = "https://image.tmdb.org/t/p/w500"
    var poster = ""
    let indicatorView = UIActivityIndicatorView(style: .gray)
    var numberThatINeed: Int = 0
    let otherView = UIView()
    let contentView = UIView()
    let scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel = DetailViewModel()
        
        if let id = movieID {
            indicatorView.startAnimating()
            viewModel?.fetchUpcomingDetail(by: id)
            self.numberThatINeed = id
        }
        
        setupSubviews()
        setupConstraints()
        setupStyle()
        
    }
    
    func setupConstraints() {
        otherView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        seeButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints += [
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            otherView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            otherView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            otherView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            otherView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overviewLabel.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 20),
            overviewLabel.widthAnchor.constraint(equalToConstant: 400),
            overviewLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            seeButton.widthAnchor.constraint(equalToConstant: 400),
            seeButton.heightAnchor.constraint(equalToConstant: 100),
            seeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            seeButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 20),
            seeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupSubviews() {
        view.addSubview(otherView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(label)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(seeButton)
        view.addSubview(indicatorView)
    }
    
    func setupStyle() {
        self.scrollView.isScrollEnabled = true
        self.scrollView.frame = view.bounds
        overviewLabel.numberOfLines = 0
        overviewLabel.backgroundColor = .clear
        overviewLabel.font = UIFont.systemFont(ofSize: 20)
        overviewLabel.textAlignment = .justified
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 30)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        seeButton.setTitle("SEE IMAGES", for: .normal)
        seeButton.backgroundColor = .clear
        seeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        seeButton.setTitleColor(.black, for: .normal)
        seeButton.layer.borderWidth = 1
        seeButton.layer.borderColor = UIColor.black.cgColor
        seeButton.layer.cornerRadius = 5
        seeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    @objc func buttonAction(sender: UIButton) {
        print("Button tapped")
        let vc = MovieImagesViewController()
        vc.movieID = numberThatINeed
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        self.scrollView.contentSize = CGSize(width:UIScreen.main.bounds.width, height: contentView.frame.height)
    //    }
}
extension DetailViewController: DetailViewModelDelegate {
    func performOnFetch(upmovies: [UpmovieDetail]) {
        DispatchQueue.main.async {
            self.upmovie = upmovies
            self.label.text = upmovies[0].title
            self.overviewLabel.text = "Overview: "+(upmovies[0].overview ?? "kjg")
            self.poster = upmovies[0].posterPath
            let str = "https://image.tmdb.org/t/p/w500"
            let imgUrl = str+self.poster
            let imageUrl = NSURL(string: imgUrl)
            let imagedata = NSData(contentsOf: imageUrl as! URL)
            self.imageView.image = UIImage(data: imagedata as! Data)
            self.otherView.backgroundColor = UIColor(patternImage: UIImage(data: imagedata! as Data)!.alpha(0.1))
            self.indicatorView.stopAnimating()
            self.scrollView.contentSize = CGSize(width:UIScreen.main.bounds.width, height: self.contentView.frame.height)
        }
    }
    
    
    
    
    func performOnError(_ error: Error) {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
            let alertController = UIAlertController(title: "Ошибка", message: "Возникла проблема при загрузке данных", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true)
            
        }
    }
}



