//
//  ListMovieView.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/14/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ListMovieView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.minimumLineSpacing = 15
        return flowLayout
    }()
    
}

extension ListMovieView: BaseViewProtocol {
    
    func buildViewHierarchy() {
        self.addSubview(self.collectionView)
    }
    
    func setupConstraints() {
        
        self.collectionView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
        }
        
    }
}

