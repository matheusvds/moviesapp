//
//  MovieAttributesView.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/15/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import UIKit

final class MovieAttributeView: UIView {
    
    var name: String
    
    lazy var word: UILabel = {
        let view = UILabel()
        view.text = self.name
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    init(frame: CGRect = .zero, name: String) {
        self.name = name
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieAttributeView: BaseViewProtocol {
    func buildViewHierarchy() {
        self.addSubview(word)
        self.addSubview(separator)
    }
    
    func setupConstraints() {
        word.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.bottom.equalTo(separator.snp.top)
            make.width.equalTo(self)
        }
        
        separator.snp.makeConstraints { (make) in
            make.height.equalTo(self).multipliedBy(0.03)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
