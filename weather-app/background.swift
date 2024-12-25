//
//  background.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//

import Foundation
import SwiftUI

struct backgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all )
    }
}

