//
//  NetworkRequest.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 28.12.2022.
//

import Foundation


class Endpoints{
    
    static let BASE_URL = "https://api.themoviedb.org/3/"
    static let API_KEY = "aa76f7101c5d03f54dc23436b43b657e"
    static let POSTER_URL = "https://image.tmdb.org/t/p/"

    
    static let MOVIES_POPULAR = "movie/popular"
    static let MOVIES_GENRES = "genre/movie/list"
    static let NOW_PLAYING = "movie/now_playing"
    
    static func getMovieURl() -> URL{
        return URL(string: "\(BASE_URL)\(MOVIES_POPULAR)?api_key=\(API_KEY)")!
    }
    
    static func getGenresURL() -> URL{
        return URL(string: "\(BASE_URL)\(MOVIES_GENRES)?api_key=\(API_KEY)")!
    }
                   
    static func getPosterUrl(with posterPath : String, quality : POSTER_QUALITY = POSTER_QUALITY.LOW) -> URL{
        return URL(string: "\(POSTER_URL)\(quality.rawValue)\(posterPath)")!
    }

}

enum POSTER_QUALITY : String{
    case LOW = "w154/", HIGH = "w500/"
}
