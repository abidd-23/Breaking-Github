//
//  CoontentViewModel.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//

import Foundation

class CoontentViewModel: ObservableObject {
    @Published var user: GitHubUser?
    @Published var errorMessage: String?

    func getUser(from url: String) async {
        guard let validUrl = URL(string: url) else {
            errorMessage = "Invalid URL entered"
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: validUrl)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw GHError.invalidResponse
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            user = try decoder.decode(GitHubUser.self, from: data)
        } catch {
            switch error {
            case GHError.invalidResponse:
                errorMessage = "Invalid response from server"
            case GHError.invalidData:
                errorMessage = "Unable to parse data"
            default:
                errorMessage = "Unexpected error: \(error.localizedDescription)"
            }
        }
    }
}
