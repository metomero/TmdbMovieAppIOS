//
//  Models.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 29.12.2022.
//

import Foundation


struct MovieResponseModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


struct GenreResponseModel: Codable {
    let genres: [Genre]
}


struct Genre: Codable {
    let id: Int
    let name: String
    
    static func createGenreString(with genreIds : [Int]) -> String {
        var categoryString = ""
        
        genreIds.forEach { genreId in
            if let genreName = Database.genres.first(where: {$0.id == genreId})?.name{
                categoryString += genreName + ","
            }
        }
        
        return String(categoryString.dropLast())
    }
}

