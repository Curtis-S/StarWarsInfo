//
//  StarWarsApiClient.swift
//  StarWarsInfo
//
//  Created by curtis scott on 22/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation


class StarWarsApiClient {
    let charactersUrl = "https://swapi.co/api/people/"
    fileprivate let vehicleUrl = "https://swapi.co/api/vehicles/"
    fileprivate let starshipsUrl = "https://swapi.co/api/starships/"
    
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias CharacterCompletionHandler = (Root?, Error?) -> Void
    typealias VehicleCompletionHandler = ([Vehicle]?, Error?) -> Void
    typealias StarshipCompletionHandler = ([Starship]?, Error?) -> Void
    typealias HomeLandCompletionHandler = (String?, Error?) -> Void
    
    
    
    
    
    func getCharacterHomeland(from url:String, completionHanderler completion: @escaping HomeLandCompletionHandler){
        
        guard let url = URL(string: url) else {
            completion(nil,StarWarsApiClientError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request)  { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, StarWarsApiClientError.requestFailed)
                        print("not repoonse")
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let homeland = try self.decoder.decode(CharacterHomeWorld.self, from: data)
                            
                            completion(homeland.name, nil)
                        } catch let error {
                            completion(nil, error)
                            print(" missing key")
                        }
                    } else {
                        completion(nil, StarWarsApiClientError.responseUnsuccessful(statusCode: httpResponse.statusCode))
                        print("status not 200 ")
                    }
                } else if let error = error {
                    completion(nil, error)
                    print("connection error \(error.localizedDescription)")
                }
                
                
            }
            
        }
        
        task.resume()
    }
    
    
    
    
    
    func getCharatcers(completionHanderler completion: @escaping CharacterCompletionHandler){
        
        guard let url = URL(string: charactersUrl) else {
            completion(nil,StarWarsApiClientError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request)  { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, StarWarsApiClientError.requestFailed)
                        print("not repoonse")
                        return
                    }
                 
                    if httpResponse.statusCode == 200 {
                        do {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let root = try self.decoder.decode(Root.self, from: data)
                            
                            completion(root, nil)
                        } catch let error {
                            completion(nil, error)
                            print("not parsing ")
                        }
                    } else {
                        completion(nil, StarWarsApiClientError.invalidData)
                        print("status not 200 ")
                    }
                } else if let error = error {
                    completion(nil, error)
                    print("connection error \(error.localizedDescription)")
                }
                
                
            }
            
        }
        
        task.resume()
    }
    
    
    func getVehicles(completionHanderler completion: @escaping VehicleCompletionHandler){
        
        guard let url = URL(string: vehicleUrl) else {
            completion(nil,StarWarsApiClientError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request)  { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, StarWarsApiClientError.requestFailed)
                        print("not repoonse")
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let vehicles = try self.decoder.decode(VehicleRoot.self, from: data)
                            
                            completion(vehicles.results, nil)
                        } catch let error {
                            completion(nil, error)
                            print(" missing key ")
                        }
                    } else {
                        completion(nil, StarWarsApiClientError.responseUnsuccessful(statusCode: httpResponse.statusCode))
                        print("status not 200 ")
                    }
                } else if let error = error {
                    completion(nil, error)
                    print("connection error \(error.localizedDescription)")
                }
                
                
            }
            
        }
        
        task.resume()
    }
    
    
    
    func getStarships(completionHanderler completion: @escaping StarshipCompletionHandler){
        
        guard let url = URL(string: starshipsUrl) else {
            completion(nil,StarWarsApiClientError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request)  { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, StarWarsApiClientError.requestFailed)
                        print("not repoonse")
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let root = try self.decoder.decode(StarshipRoot.self, from: data)
                            
                            completion(root.results, nil)
                        } catch let error {
                            completion(nil, error)
                            print("not parsing ")
                        }
                    } else {
                        completion(nil, StarWarsApiClientError.responseUnsuccessful(statusCode: httpResponse.statusCode))
                        print("status not 200 ")
                    }
                } else if let error = error {
                    completion(nil, error)
                    print("connection error \(error.localizedDescription)")
                }
                
                
            }
            
        }
        
        task.resume()
    }
    
    
    
    
    /*
    private func getWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, DarkSkyError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, DarkSkyError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(Weather.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, DarkSkyError.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
 */
    /*
   func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
       getWeather(at: coordinate) { weather, error in
           completion(weather?.currently, error)
       }
   }
 */
    
}

