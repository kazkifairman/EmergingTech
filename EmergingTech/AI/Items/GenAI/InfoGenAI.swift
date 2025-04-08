//
//  AIToolsExample.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 24/03/2025.
//

import SwiftUI

struct InfoGenAI: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("🧠 Exploring Generative AI")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)

                VStack(alignment: .leading, spacing: 15) {
                    Text("🚀 What is Generative AI?")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        Generative AI refers to models that can create new content, such as text, images, audio, and even video, by learning \
                        patterns from large datasets. Popular examples include ChatGPT, DALL·E, and Midjourney.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("🌟 The Promise of Generative AI")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        Generative AI has the potential to revolutionize industries by automating content creation, enhancing creativity, \
                        improving customer experiences, and generating realistic simulations in gaming and virtual environments.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("⚖️ Ethical Use of AI")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        As AI becomes more powerful, it's essential to ensure ethical use. Transparency, fairness, and privacy must be \
                        prioritized to prevent misuse and protect user data.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("⚡ Concerns and Limitations")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        Despite its promise, generative AI has some challenges. It can sometimes produce biased or inaccurate content. \
                        Ongoing research is focused on minimizing these risks and improving model performance.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("🤔 Addressing AI Bias")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        Bias in AI models arises when the training data contains implicit biases. Developers are actively working \
                        to address these biases by ensuring more representative and diverse datasets.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()

                NavigationLink(destination: InfoGenAI()) {
                    Text("🖥️ Explore Generative AI in Action")
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
        .navigationTitle("Generative AI")
    }
}

