//
//  CollectionViewCell.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 26.12.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell{

    static let identifier = "CollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
        
    @IBOutlet var movieName : UILabel!
    @IBOutlet var movieImage : UIImageView!
    @IBOutlet var movieCategory : UILabel!
    @IBOutlet var movieAverage : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with movie : Movie){
        movieName.text = movie.title
        movieImage.downloaded(from: Endpoints.getPosterUrl(with: movie.posterPath, quality: POSTER_QUALITY.HIGH))
        movieCategory.text = Genre.createGenreString(with: movie.genreIDS)
        movieAverage.text = String(movie.voteAverage)
    }

}
