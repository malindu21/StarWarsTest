//
//  PlanetDetailView.swift
//  StarWarsXitebTest
//
//  Created by Malinduk on 2024-11-22.
//

import Foundation
import Kingfisher
import SwiftUI

struct PlanetDetailView: View {
    let planet: Planet
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Image(Constants.Images.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(alignment: .center, spacing: 16) {
                KFImage(URL(string: Constants.Images.placeholderImageURL)!)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)

                Text(planet.name)
                    .font(.largeTitle)
                    .bold()

                HStack {
                    Text(Constants.Text.orbitalPeriod)
                        .bold()
                    Spacer()
                    Text(planet.orbitalPeriod)
                }

                HStack {
                    Text(Constants.Text.gravity)
                        .bold()
                    Spacer()
                    Text(planet.gravity)
                }

                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(radius: 10)
            )
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: Constants.Icons.close)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
