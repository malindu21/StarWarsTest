//
//  PlanetsViewModel.swift
//  StarWarsXitebTest
//
//  Created by Malinduk on 2024-11-22.
//

import Foundation
import Combine

class PlanetsViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPlanets() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: APIConstants.planetsEndpoint) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PlanetsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.planets = response.results
            }
            .store(in: &cancellables)
    }
}
