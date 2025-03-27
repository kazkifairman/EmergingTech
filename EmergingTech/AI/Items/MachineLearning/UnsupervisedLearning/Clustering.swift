//
//  Clustering.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 27/03/2025.
//

import SwiftUI
import RealityKit

struct Clustering: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("🔎 Understanding Clustering Algorithms")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)

                VStack(alignment: .leading, spacing: 15) {
                    Text("🧩 What is Clustering?")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        Clustering is an unsupervised learning technique where data points are grouped into clusters based on their similarities. \
                        Unlike classification, clustering doesn't require labeled data. It discovers the underlying patterns and structures within \
                        the data.

                        Clustering is often used in:
                        - Customer segmentation
                        - Image compression
                        - Anomaly detection
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("⚙️ Introduction to K-Means Clustering")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        K-Means is one of the most widely used clustering algorithms. It partitions data into K clusters, where each data point belongs \
                        to the cluster with the nearest mean.

                        The algorithm iteratively refines the cluster assignments by minimizing the distance between data points and the cluster centroids.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()

                NavigationLink(destination: KMeans()) {
                    Text("📊 Explore K-Means Clustering in 3D")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
        .navigationTitle("Clustering")
    }
}
