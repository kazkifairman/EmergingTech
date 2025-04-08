//
// AIImmersiveView.swift
// EmergingTech
//
// Created by InnovationShowroom on 24/03/2025.
//

import SwiftUI


struct AIImmersiveView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Explore AI Innovations")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("Choose a topic to explore:")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            NavigationLink(destination: InfographicsAI()) {
                                VStack {
                                    Image(systemName: "dollarsign.bank.building")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .padding(.bottom, 10)
                                    Text("AI in Financial Services")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text("Explore how AI is changing different industries.")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                .frame(width: 200, height: 220)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(20)
                            }

                            NavigationLink(destination: MachineLearning()) {
                                VStack {
                                    Image(systemName: "network")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .padding(.bottom, 10)
                                    Text("Machine Learning")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text("Learn about Neural Networks and more.")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                .frame(width: 200, height: 220)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(20)
                            }

                            NavigationLink(destination: InfoGenAI()) {
                                VStack {
                                    Image(systemName: "brain")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .padding(.bottom, 10)
                                    Text("Generative AI")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text("Explore simulations and AI-powered tools.")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                .frame(width: 200, height: 220)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 300)
                }

                Spacer()
            }
            .padding()
        }
    }
}
