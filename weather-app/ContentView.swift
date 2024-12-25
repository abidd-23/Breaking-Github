//
//  ContentView.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight =  false
    var body: some View {
        ZStack {
            backgroundView(isNight: $isNight )
            VStack{
                Text("Lucknow , IN")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white )
                    .padding()
                VStack(spacing: 5){
                    Image("herb")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("54°").font(.system(size: 70, weight: .medium)).foregroundColor(.white )
                }
                .padding(.bottom , 40)
                HStack{
                    WeatherView(day: "TUE", imageName: "herb", temp: 74)
                    WeatherView(day: "TUE", imageName: "herb", temp: 74)
                    WeatherView(day: "TUE", imageName: "herb", temp: 74)
                    WeatherView(day: "TUE", imageName: "herb", temp: 74)
                    WeatherView(day: "TUE", imageName: "herb", temp: 74)
                    
                }
                Spacer()
                Button{
                    isNight.toggle()
                    
                } label: {
                    Text("Change day time")
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                }
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherView: View {
    var day: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(day).font(.system(size: 15, weight: .bold)).foregroundColor(.white )
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temp)° ").font(.system(size: 28, weight: .medium)).foregroundColor(.white )
        }
    }
}

//struct backgroundView: View {
//    @Binding var isNight: Bool
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all )
//    }
//}

