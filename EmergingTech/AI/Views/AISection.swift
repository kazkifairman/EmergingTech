//
//  AISection.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//

import SwiftUI

struct AISection: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 30) {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding(.top, 40)

                    Text("Artificial Intellingence")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text("Explore the world of Artificial Intelligence. Learn through immersive experiences, interactive visuals, and simple explanations.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    NavigationLink(destination: AIImmersiveView().edgesIgnoringSafeArea(.all)) {
                        Text("Start Exploring")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
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
