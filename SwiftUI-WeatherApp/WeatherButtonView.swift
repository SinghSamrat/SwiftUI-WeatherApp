//
//  WeatherButtonView.swift
//  SwiftUI-WeatherApp
//
//  Created by Samrat Singh on 08/06/2025.
//

import SwiftUI

struct WeatherButtonView: View {
    var buttonText: String
    @Binding var isNight: Bool
    
    var body: some View {
        Text(buttonText)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(.blue)
            .frame(width: 280, height: 50, alignment: .center)
            .background(isNight ? Color("darkGray") : .white)
            .cornerRadius(10)
    }
}
