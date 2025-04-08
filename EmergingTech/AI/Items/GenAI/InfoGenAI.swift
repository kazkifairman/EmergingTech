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
            VStack(spacing: 16) {
                Text("🧠")
                    .font(.system(size: 60))
                    .padding(.top, 30)
                
                Text("Generative AI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("An introduction to the capabilities, promise, concerns, and responsible use of AI that creates.")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                VStack(spacing: 24) {
                    FeatureCard(
                        icon:"questionmark.circle",
                        title: "What is Generative AI?",
                        description: "Generative AI refers to models that can create new content, such as text, images, audio, and even video, by learning patterns from large datasets. Popular examples include ChatGPT, DALL·E, Gemini."
                    )
                    FeatureCard(
                        icon:"lightbulb",
                        title: "The Promise of Generative AI",
                        description: "Generative AI has the potential to revolutionize industries by automating content creation, enhancing creativity, improving customer experiences, and generating realistic simulations in gaming and virtual environments."
                    )
                    FeatureCard(
                        icon:"lock.shield",
                        title: "Ethical Use of AI",
                        description: "As AI becomes more powerful, it's essential to ensure ethical use. Transparency, fairness, and privacy must be prioritized to prevent misuse and protect user data."
                    )
                    FeatureCard(
                        icon:"exclamationmark.triangle.fill",
                        title: "Concerns and Limitations",
                        description: "Despite its promise, generative AI has some challenges. It can sometimes produce biased or inaccurate content. Ongoing research is focused on minimizing these risks and improving model performance."
                    )
                    FeatureCard(
                        icon: "xmark.circle",
                        title: "Addressing AI Bias",
                        description: "Bias in AI models arises when the training data contains implicit biases. Developers are actively working to address these biases by ensuring more representative and diverse datasets."
                    )
                }
                .padding(.horizontal)
                
                
                NavigationLink(destination: ExampleGenAI()) {
                    
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
