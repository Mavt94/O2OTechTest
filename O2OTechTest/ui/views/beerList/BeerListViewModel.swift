//
//  BeerListViewModel.swift
//  O2OTechTest
//
//  Created by Manuel Vera Trinidad on 30/12/23.
//

import Foundation

@MainActor
final class BeerListViewModel: ObservableObject {
    @Published var beers: [BeerListModel.Beer] = []
    @Published var filteredBeers: [BeerListModel.Beer] = []
    @Published var finderValue: String = ""
    @Published var selectedBeer: BeerListModel.Beer?
}

// MARK: - Private
extension BeerListViewModel {
    private func loadData() async {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let beers = try JSONDecoder().decode([BeerListModel.Beer].self, from: data)
                DispatchQueue.main.async {
                    self.beers = beers
                    self.filteredBeers = beers
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

// MARK: - Public
extension BeerListViewModel {
    func loadViewModel() {
        Task {
            await loadData()
        }
    }
    
    func filterResults() {
        var matchResult = false
        
        if finderValue == "" {
            filteredBeers = []
            filteredBeers = beers
        } else {
            filteredBeers = []
            beers.forEach { beer in
                beer.foodPairing?.forEach { foodPairing in
                    if foodPairing.localizedCaseInsensitiveContains(self.finderValue) {
                        matchResult = true
                    }
                }
                if matchResult {
                    filteredBeers.append(beer)
                    matchResult = false
                }
            }
        }
    }
}
