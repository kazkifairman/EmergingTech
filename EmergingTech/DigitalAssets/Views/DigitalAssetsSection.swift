//
//  DigitalAssetsSection.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//

import SwiftUI

struct DigitalAssetsSection: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 30) {
                    Image(systemName: "bitcoinsign.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                        .padding(.top, 40)

                    Text("Digital Assets")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text("Discover the future of finance through Digital Assets. Understand blockchain, crypto, and tokenization in a simple and immersive way.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    NavigationLink(destination: DAImmersiveView().edgesIgnoringSafeArea(.all)) {
                        Text("Explore Now")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
