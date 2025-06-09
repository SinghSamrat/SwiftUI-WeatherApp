//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Samrat Singh on 08/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var isNight: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: -10) {
                TodayWeatherView(city: "Kathmandu", temperature: 27, iconName: isNight ? "cloud.moon.fill" : "cloud.sun.fill")
                
                Spacer()
                
                ZStack {
                    Color(isNight ? .black : .blue)
                        .cornerRadius(10)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .frame(width: 400, height: 200, alignment: .center)
                        .opacity(0.4)
                    
                    HStack(spacing: 25) {
                        WeatherDayView(day: "MON", iconName: "cloud.sun.fill", temperature: 24)
                        WeatherDayView(day: "TUE", iconName: "cloud.sun.rain.fill", temperature: 24)
                        WeatherDayView(day: "WED", iconName: "sun.max.fill", temperature: 24)
                        WeatherDayView(day: "THU", iconName: "cloud.heavyrain.fill", temperature: 24)
                        WeatherDayView(day: "FRI", iconName: "snowflake", temperature: 24)
                    }.frame(width: 400, height: 200, alignment: .center)
                }
                
                Spacer()
                
                Button {
                    print("Button Pressed.")
                } label: {
                    WeatherButtonView(buttonText: "Change Day Time", isNight: $isNight)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var day: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct TodayWeatherView: View {
    var city: String
    var temperature: Int
    var iconName: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 34, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 40)
        
        Image(systemName: iconName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
        
        Text("\(temperature)°")
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("skyBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}
