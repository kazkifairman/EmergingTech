//
//  ExampleGenAI.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 27/03/2025.
//

import SwiftUI

struct ExampleGenAI: View {
    @State private var userInput: String = ""
    @State private var aiResponse: String = "Ask me anything about Generative AI!"
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 20) {
            Text("🤖 Chat with AI")
                .font(.largeTitle)
                .padding(.top, 20)

            ScrollView {
                Text(aiResponse)
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)
            }

            TextField("Type your question...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)

            Button(action: {
                sendMessageToChatGPT()
            }) {
                Text("Send")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isLoading ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .disabled(isLoading)
            
            Spacer()
        }
        .padding()
    }

    // Function to send message to ChatGPT API
    
    func sendMessageToChatGPT() {
        guard !userInput.isEmpty else { return }
        
        guard let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"] else {
            aiResponse = "API Key not found."
            return
        }

        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "system", "content": "You are a helpful assistant."],
                ["role": "user", "content": userInput]
            ],
            "max_tokens": 500
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            aiResponse = "Error creating request."
            return
        }

        isLoading = true

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    aiResponse = "Error: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    aiResponse = "No data received."
                    return
                }

                do {
                    print(String(data: data, encoding: .utf8) ?? "Invalid data")

                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let error = json["error"] as? [String: Any],
                           let message = error["message"] as? String {
                            aiResponse = "API Error: \(message)"
                        } else if let choices = json["choices"] as? [[String: Any]],
                                  let message = choices.first?["message"] as? [String: Any],
                                  let content = message["content"] as? String {
                            aiResponse = content.trimmingCharacters(in: .whitespacesAndNewlines)
                        } else {
                            aiResponse = "Unexpected response format."
                        }
                    }
                } catch {
                    aiResponse = "Error parsing response."
                }
            }
        }.resume()

        // Clear user input after sending
        userInput = ""
    }
}
