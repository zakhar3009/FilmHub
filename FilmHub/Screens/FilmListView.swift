//
//  FilmListView.swift
//  FilmHub
//
//  Created by Zakhar Litvinchuk on 16.05.2024.
//


import SwiftUI

final class FilmListViewModel: ObservableObject {
    @Published var city: String = "City"
    @Published var cinema: String = "Cinema"
}


struct FilmListView: View {
    let films = [Film(
        id: 1,
        title: "Inception",
        releaseDate: Date(),
        language: "English",
        duration: 8880, // Довжина фільму у секундах
        poster: "inception_poster.jpg",
        director: "Christopher Nolan",
        rating: 8.8
    ),
                 Film(
                    id: 2,
                    title: "The Shawshank Redemption",
                    releaseDate: Date(timeIntervalSince1970: 747859200),
                    language: "English",
                    duration: 8520, // Довжина фільму у секундах
                    poster: "shawshank_redemption_poster.jpg",
                    director: "Frank Darabont",
                    rating: 9.3
                 ),
                 Film(
                    id: 3,
                    title: "The Godfather",
                    releaseDate: Date(timeIntervalSince1970: 478224000),
                    language: "English",
                    duration: 10500,
                    poster: "godfather_poster.jpg",
                    director: "Francis Ford Coppola",
                    rating: 9.2
                 ),
                 Film(
                    id: 4,
                    title: "The Dark Knight",
                    releaseDate: Date(timeIntervalSince1970: 1218060800),
                    language: "English",
                    duration: 9120,
                    poster: "dark_knight_poster.jpg",
                    director: "Christopher Nolan",
                    rating: 9.0
                 ),
                 Film(
                    id: 5,
                    title: "Pulp Fiction",
                    releaseDate: Date(timeIntervalSince1970: 783216000),
                    language: "English",
                    duration: 9240,
                    poster: "pulp_fiction_poster.jpg",
                    director: "Quentin Tarantino",
                    rating: 8.9
                 )]
    
    @ObservedObject private var filmListModel = FilmListViewModel()
    
    private let userRole: UserRole
    
    init(userRole: UserRole) {
        self.userRole = userRole
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                FilmListHeader(filmListModel: filmListModel)
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(self.films, id: \.id) { film in
                            NavigationLink(value: film,
                                           label: {
                                FilmView(film: film)
                            })
                        }
                        
                    }
                    .padding(.top, 20)
                }
            }
            .navigationDestination(
                for: Film.self,
                destination: { FilmDeatailsView(film: $0) }
            )
        }
    }
    
    struct FilmListHeader: View {
        @ObservedObject private var filmListModel: FilmListViewModel
        var options = ["Cinema", "b", "c", "d", "e"]
        
        init(filmListModel: FilmListViewModel) {
            self.filmListModel = filmListModel
        }
        var body: some View {
            HStack {
                CustomMenu(selectedItem: $filmListModel.city,
                           options: options)
                CustomMenu(selectedItem: $filmListModel.cinema,
                           options: options)
                Spacer()
                
            }
            .frame(height: 40)
            .background(Color("BackgroundColor"))
            
        }
    }
    
    struct CustomMenu: View {
        @Binding var selectedItem: String
        let options: [String]
        
        init(selectedItem: Binding<String>, options: [String]) {
            self._selectedItem = selectedItem
            self.options = options
        }
        
        var body: some View {
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedItem = option
                    }, label: {
                        Text(option)
                    })
                }
            } label: {
                Text(selectedItem)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 20)
        }
    }
}
