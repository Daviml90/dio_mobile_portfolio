//
//  DetailView.swift
//  Movies
//
//  Created by Davi Martinelli de Lira on 10/20/23.
//

import SwiftUI

struct DetailView: View {
    
    var movie: Movie?
    
    var body: some View {
        NavigationView{
            HStack(alignment: .top) {
                ScrollView {
                    VStack {
                        Text(movie?.title ?? "Overview")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("Release Date")
                            .padding(4)
                            .foregroundColor(.white)
                            .background(.orange.gradient)
                            .cornerRadius(10)
                        Text(movie?.release_date.dateFormatter() ?? "Today!")
                            .underline()
                            .foregroundColor(.red)
                            .font(.title)
                        Image(systemName: "quote.opening")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .padding(.horizontal, 20)
                        Text(movie?.overview ?? "Recently fired and desperate for work, a troubled young  discovers that nothing at Freddy's is what it seems.Recently fired and desperate for work, a troubled young  discovers hing at Freddy's is what it seemsRecently fired and desperate for work, a troubled young  discovers that nothing at Freddy's is what it seems..")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding(15)
                            .frame(alignment: .center)
                            .background(.white)
                            .opacity(0.8)
                            .cornerRadius(20)
                            .padding(20)
                        Image(systemName: "quote.closing")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment:.trailing)
                            .padding(.horizontal, 20)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(LinearGradient(colors: [Color(.orange), Color(.white)], startPoint: .bottom, endPoint: .topLeading))
            
        }
        
    }
    
}





#Preview {
    DetailView()
}
