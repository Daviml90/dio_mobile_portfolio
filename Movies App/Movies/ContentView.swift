//
//  ContentView.swift
//  Movies
//
//  Created by Davi Martinelli de Lira on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                
                List(viewModel.movies, id: \.id) { movie in
                    
                    NavigationLink(destination: DetailView(movie: movie), label: {
                        Text(movie.title)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    )
                    .listRowBackground(LinearGradient(colors: [Color(.yellow), Color(.white)], startPoint: .trailing, endPoint: .leading))
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue.gradient)
            
            .navigationTitle("Upcoming Movies 🎥")
        }
        
    }
    
    
}




#Preview {
    ContentView()
}
