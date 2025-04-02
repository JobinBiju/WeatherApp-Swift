//
//  ContentView.swift
//  weather
//
//  Created by Jobin Biju on 28/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityMainView(cityName: "Kakkanad, KL")
                MainStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 32)
                HStack(spacing: 16) {
                    WeatherDayView(dayOfWeek: "TUE",  imageName: "cloud.sun.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "WED",  imageName: "sun.max.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "THU",  imageName: "wind.snow", temperature: 31)
                    WeatherDayView(dayOfWeek: "FRI",  imageName: "sunset.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "SAT",  imageName: "moon.stars.fill", temperature: 37)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
               
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: isNight ? [.black, .gray] : [.blue, Color("lightBlue")]), startPoint: .top, endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

struct CityMainView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 64, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}


