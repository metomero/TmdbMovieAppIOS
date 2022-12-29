//
//  CollectionTableViewCell.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 28.12.2022.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    static var identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    var movies = [Movie]()
    
    @IBOutlet var collectionView : UICollectionView!
    
    var onMovieClicked : ((Movie)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        cell.configure(with: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        onMovieClicked!(movies[indexPath.row])
    }
    

    func configure(with movies : [Movie]){
        self.movies = movies
        collectionView.reloadData()
    }
    
    
    
}
