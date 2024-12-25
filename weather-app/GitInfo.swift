//
//  GitInfo.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//

import SwiftUI

struct GitInfo: View {
    @State private var isNight =  false
    @State private var gitInput: String = ""
    @State private var moveToNextScreen = false
    @StateObject private var viewModel = GitInfoViewModel()
    var body: some View {
        NavigationView{
        ZStack{
            backgroundView(isNight: $isNight )
            VStack{
                Image("walter").resizable().scaledToFit()
                
                Text("Breaking Git").font(.title).fontWeight(.bold)
                TextField("Enter the url", text: $viewModel.gitInput).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Button(action: {
                    if URL(string: viewModel.gitInput) != nil {
                                                viewModel.navigateToResult = true
                                            } else {
                                                print("Invalid URL entered")
                                            }
                }) {
                            Image("button").resizable().frame(width: 100, height: 100)
                                
                        }
                        .buttonStyle(PlainButtonStyle())
                
                NavigationLink(
                                        destination: CoontentView(gitUrl: viewModel.gitInput),
                                        isActive: $viewModel.navigateToResult
                                    ) {
                                        EmptyView()
                                    }
                
                
            }
            
            
        }
    }
}
    
}

#Preview {
    GitInfo()
}

//https://api.github.com/users/abidd-23
