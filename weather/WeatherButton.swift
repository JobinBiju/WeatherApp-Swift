//
//  WeatherButton.swift
//  weather
//
//  Created by Jobin Biju on 29/03/25.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
        
    }
}
