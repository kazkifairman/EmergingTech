//
//  MachineLearning.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 27/03/2025.
//

import SwiftUI
import RealityKit

struct MachineLearning: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Explore Machine Learning")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()

                ScrollView {
                    VStack(spacing: 20) {
                        // Unsupervised Learning Section
                        NavigationLink(destination: Clustering()) {
                            VStack {
                                Text("🧩 Unsupervised Learning")
                                    .font(.title)
                                    .padding(.bottom, 5)
                                Text("Explore how clustering works by visualizing data points grouped based on similarities.")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(12)
                        }

                        // Supervised Learning Section
                        NavigationLink(destination: Classification()) {
                            VStack {
                                Text("🎯 Supervised Learning")
                                    .font(.title)
                                    .padding(.bottom, 5)
                                Text("See how classification models work by identifying and labeling data based on known patterns.")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                }
                .frame(height: 400)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}




// RealityKit Container for displaying 3D models
struct RealityViewContainer: View {
    var modelName: String

    var body: some View {
        RealityView { content in
            if let modelEntity = try? Entity.load(named: modelName) {
                let anchor = AnchorEntity(world: [0, 0, -1])
                anchor.addChild(modelEntity)
                content.add(anchor)
            }
        }
    }
}
