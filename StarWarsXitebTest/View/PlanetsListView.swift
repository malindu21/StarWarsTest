//
//  PlanetsListView.swift
//  StarWarsXitebTest
//
//  Created by Malinduk on 2024-11-22.
//

import Kingfisher
import SwiftUI

struct PlanetsListView: View {
    @StateObject private var viewModel = PlanetsViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.planets) { planet in
                    NavigationLink(destination: PlanetDetailView(planet: planet)) {
                        VStack(alignment: .leading) {
                            Text(planet.name)
                                .font(.headline)
                            Text("\(Constants.Text.climate) \(planet.climate)")
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                    }
                }
                .navigationTitle(Constants.Text.planetsTitle)
                .onAppear {
                    viewModel.fetchPlanets()
                }

                if viewModel.isLoading {
                    ProgressView(Constants.Text.loadingMessage)
                }

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

#Preview {
    PlanetsListView()
}
