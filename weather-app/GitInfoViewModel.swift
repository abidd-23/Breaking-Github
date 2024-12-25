//
//  GitInfoViewModel.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//

import Foundation

class GitInfoViewModel: ObservableObject {
    @Published var gitInput: String = ""
    @Published var navigateToResult: Bool = false
}

