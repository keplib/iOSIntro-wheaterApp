//
//  viewModel.swift
//  weatherApp
//
//  Created by Balázs Képli on 29/08/2024.
//

import Foundation


class WeatherVM: ObservableObject {
    @Published var weatherForcast :[Weather] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let weatherForecast = try JSONDecoder().decode([Weather].self, from: data)
                self.weatherForcast = weatherForecast
                print(self.weatherForcast)
            } catch {
                print(error)
                print("Something went wrong!")
            }
        }
    }
}
