//
//  MovieCell.swift
//  moviesapp
//
//  Created by Marco Marques on 04/05/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var thumbMovie: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        thumbMovie = {
            let view = UIImageView(frame: .zero)
            view.backgroundColor = .green
            view.image = #imageLiteral(resourceName: "empty_movie")
            return view
        }()
        contentView.addSubview(thumbMovie)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = thumbMovie.frame
        frame.size.height = self.frame.size.height
        frame.size.width = self.frame.size.width
        frame.origin.x = 0
        frame.origin.y = 0
        thumbMovie.frame = frame
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
