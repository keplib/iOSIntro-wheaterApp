//
//  ContentView.swift
//  weatherApp
//
//  Created by Balázs Képli on 27/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @StateObject private var data = WeatherVM()
     
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(isNight: isNight, temperature: 76)
                
                HStack {
                    ForEach(data.weatherForcast) { forecast in
                        WheatherDayView(dayOfWeek: forecast.day, imageName: forecast.iconName, temperature: forecast.temperature)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WheatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,  isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    
    var isNight: Bool
    
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: isNight ? "cloud.moon.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature) º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


