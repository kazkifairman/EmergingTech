//
//  InfographicsAI.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 24/03/2025.
//

import SwiftUI

struct InfographicsAI: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("AI in Financial Services")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("Discover how AI is transforming the world of finance:")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                ScrollView {
                    VStack(spacing: 30) {
                        FeatureCard(
                            icon: "lock.shield",
                            title: "Fraud Detection",
                            description: "AI models analyze transactions in real-time to flag suspicious activity and reduce fraud."
                        )

                        FeatureCard(
                            icon: "chart.line.uptrend.xyaxis",
                            title: "Algorithmic Trading",
                            description: "Predictive models make high-speed decisions based on market trends to optimize trades."
                        )

                        FeatureCard(
                            icon: "person.crop.circle.badge.checkmark",
                            title: "Personalized Banking",
                            description: "AI-powered assistants provide tailored support and financial recommendations to users."
                        )

                        FeatureCard(
                            icon: "exclamationmark.triangle",
                            title: "Risk Management",
                            description: "AI helps assess credit risk and predict defaults to support safer lending decisions."
                        )
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }

                NavigationLink(destination: AIFinancial3DView()) {
                    Text("🔍 Explore AI in Finance in 3D")
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
        }
    }
}

struct FeatureCard: View {
    var icon: String
    var title: String
    var description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }

            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }
}
