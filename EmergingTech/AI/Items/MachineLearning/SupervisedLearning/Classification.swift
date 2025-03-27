//
//  Classification.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 27/03/2025.
//

import SwiftUI
import RealityKit

struct Classification: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("🤖 Understanding Classification Algorithms")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)

                VStack(alignment: .leading, spacing: 15) {
                    Text("🔍 What is Classification?")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        Classification is a supervised learning technique where a model is trained to classify data into different categories. \
                        It uses labeled data to learn the relationship between the input and output and then predicts the label for new, unseen data.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("📏 Understanding Linear Separability")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        One key concept in classification is **linear separability**. A dataset is considered linearly separable when a straight line \
                        (or a hyperplane in higher dimensions) can perfectly separate the data into different classes.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("📚 Common Algorithms Using Linear Separability")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("- Logistic Regression")
                        Text("- Support Vector Machines (SVM)")
        
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()

                NavigationLink(destination: ThreeDGraph()) {
                    Text("🎥 Explore Linear Separability in 3D")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
        .navigationTitle("Classification")
    }
}
