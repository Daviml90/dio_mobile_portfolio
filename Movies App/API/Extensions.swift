//
//  Extensions.swift
//  Movies
//
//  Created by Davi Martinelli de Lira on 10/20/23.
//

import Foundation
import SwiftUI
import Combine
import SwiftDate

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var movies = [Movie]()
        
        let apiKey = "63d0413fa4a251c5ae13922433c8a784"
        var cancellables = Set<AnyCancellable>()
        var result = MoviesResponse.self
        
        init() {
            getMovies()
        }
        
        func getMovies() {
            let urlString = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)"
            guard let url = URL(string: urlString) else {return}
            
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap({ (data, response) -> Data in
                    guard
                        let response = response as? HTTPURLResponse,
                        response.statusCode >= 200 else {
                        throw URLError(.badServerResponse)
                    }
                    
                    return data
                })
                .decode(type: MoviesResponse.self, decoder: JSONDecoder())
                .sink(receiveCompletion: {(completion) in
                    switch completion {
                    case .finished:
                        print("Publisher stopped observing")
                    case.failure(let error):
                        print(error)
                    }}
                      , receiveValue: { (movies) in
                    self.movies = movies.results
                    
                }).store(in: &cancellables)
        }
        
    }
}

extension String {
    
    func dateFormatter() -> String {
        
        let date = self.toDate("yyyy-MM-dd")
        
        
        if let date {
            
            var daySymbol = ""
            
            switch date.day {
            case 1:
                daySymbol = "st"
            case 2:
                daySymbol =  "nd"
            case 3:
                daySymbol =  "rd"
            default:
                daySymbol =  "th"
            }
            
            let monthName = DateFormatter().monthSymbols[date.month - 1]
            return "\(monthName) \(date.day)\(daySymbol), \(date.year)"} else {
                return self
            }
    }
}
