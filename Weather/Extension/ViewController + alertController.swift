//
//  ViewController + alertController.swift
//  Weather
//
//  Created by Александр Матукин on 27.11.2021.
//

import UIKit

extension WelcomeViewController {
    public func pressentSearchAlertController (
        withTitle title: String?,
        message: String?,
        style: UIAlertController.Style,
        completionHandler: @escaping (String) -> Void
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { city in
            let cites = ["San Francisci", "Moscow", "New York", "Stambul", "Viena"]
            city.placeholder = cites.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
//                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
