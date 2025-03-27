//
//  AIImmersiveView.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 24/03/2025.
//

import SwiftUI

struct AIImmersiveView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Explore AI Innovations")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()

                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            NavigationLink(destination: InfographicsAI()) {
                                VStack {
                                    Text("🤖")
                                        .font(.system(size: 50))
                                        .padding()
                                    Text("AI in Industries")
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                    Text("Explore how AI is changing different industries.")
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                .padding()
                                .frame(width: geometry.size.width * 0.7, height: 250)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(15)
                            }

                            NavigationLink(destination: MachineLearning()) {
                                VStack {
                                    Text("🧠")
                                        .font(.system(size: 50))
                                        .padding()
                                    Text("Machine Learning")
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                    Text("Learn about Neural Networks and more.")
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                .padding()
                                .frame(width: geometry.size.width * 0.7, height: 250)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(15)
                            }

                            NavigationLink(destination: AIToolsExample()) {
                                VStack {
                                    Text("🚀")
                                        .font(.system(size: 50))
                                        .padding()
                                    Text("AI Tools")
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                    Text("Explore simulations and AI-powered tools.")
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                .padding()
                                .frame(width: geometry.size.width * 0.7, height: 250)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(15)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }
                    .frame(height: 300)
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxHeight: .infinity)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
