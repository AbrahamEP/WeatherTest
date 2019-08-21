//
//  API.swift
//  Test01
//
//  Created by Abraham Escamilla Pinelo on 8/20/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

enum MyWeatherErros: Error {
    case NoWeatherInfo
    case NoInternetConnection
    case ZipCodeInvalid
    
    public var description: String {
        switch self {
        case .NoInternetConnection:
            return "There is no internet connection right now"
        case .NoWeatherInfo:
            return "There is no weather info"
        case .ZipCodeInvalid:
            return "Invalid zip code"
        }
    }
}

class API {
    
    static let manager = API()
    
    func getWeatherInfo(byZipCode code: String?, completion: (_ wehaterInfo: String?, _ error: Error?) -> Void) {
        
        guard let code = code else {
            completion(nil, MyWeatherErros.ZipCodeInvalid)
            return
        }
        if code == "0" {
            completion("This is the weather info", nil)
        } else if code == "1" {
            completion(nil, MyWeatherErros.NoWeatherInfo)
        }else if code == "2" {
            completion(nil, MyWeatherErros.NoInternetConnection)
        }
    }
}
