//
//  ListMoviesViewController.swift
//  moviesapp
//
//  Created by Marco Marques on 04/05/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func createCollectionViewMovie() {
        
        self.title = "Movies"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.2, height: 200)
        
        let myCollectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.movieCellIdentifier)
        myCollectionView.backgroundColor = .white
        
        self.view.addSubview(myCollectionView)
    }
}

extension ListMoviesViewController: BaseViewProtocol {
    func buildViewHierarchy() {
        self.createCollectionViewMovie()
    }
    
    func setupConstraints() {
      
    }
    
    
}

extension ListMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.movieCellIdentifier, for: indexPath) as! MovieCell
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
}
