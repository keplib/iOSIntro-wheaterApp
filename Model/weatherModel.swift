//
//  weatherModel.swift
//  weatherApp
//
//  Created by Balázs Képli on 29/08/2024.
//

import Foundation

struct Weather: Codable, Identifiable {
    enum CodingKeys: CodingKey {
                    case day
                    case temperature
                    case iconName
                }
    var id = UUID()
    var day: String
    var temperature: Int
    var iconName: String
}

