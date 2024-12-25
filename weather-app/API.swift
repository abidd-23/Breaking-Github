//
//  API.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//

import SwiftUI

struct CoontentView: View {
    @StateObject private var viewModel = CoontentViewModel()
    let gitUrl: String
    @State private var isNight =  false

    var body: some View {
        ZStack {
            backgroundView(isNight: $isNight )
            VStack(spacing: 20) {
                if let user = viewModel.user {
                    AsyncImage(url: URL(string: user.avatarUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle().foregroundColor(.white)
                    }
                    .frame(width: 200, height: 200)

                    Text(user.login)
                        .font(.system(size: 40, weight: .bold, design: .default))

                    Text(user.bio ?? "I Like Ice Cream")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                }

                Spacer()
            }
        }
        .task {
            await viewModel.getUser(from: gitUrl)
        }
    }
}

#Preview {
    CoontentView(gitUrl: "https://api.github.com/users/octocat")
}
