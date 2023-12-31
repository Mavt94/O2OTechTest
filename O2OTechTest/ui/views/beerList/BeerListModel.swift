//
//  BeerListModel.swift
//  O2OTechTest
//
//  Created by Manuel Vera Trinidad on 30/12/23.
//

import Foundation

final class BeerListModel {
    struct Beer: Hashable, Decodable {
        let id: Int?
        let name: String?
        let tagline: String?
        let firstBrewed: String?
        let description: String?
        let imageURL: String?
        let abv: Double?
        let ibu: Double?
        let targetFg: Double?
        let targetOg: Double?
        let ebc: Int?
        let srm: Double?
        let ph: Double?
        let attenuationLevel: Double?
        let volume: BoilVolume?
        let boilVolume: BoilVolume?
        let method: Method?
        let ingredients: Ingredients?
        let foodPairing: [String]?
        let brewersTips: String?
        let contributedBy: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case tagline
            case firstBrewed = "first_brewed"
            case description
            case imageURL = "image_url"
            case abv
            case ibu
            case targetFg = "target_fg"
            case targetOg = "target_og"
            case ebc
            case srm
            case ph
            case attenuationLevel = "attenuation_level"
            case volume
            case boilVolume = "boil_volume"
            case method
            case ingredients
            case foodPairing = "food_pairing"
            case brewersTips = "brewers_tips"
            case contributedBy = "contributed_by"
        }
    }
    
    struct BoilVolume: Hashable, Decodable {
        let value: Double?
        let unit: String?
        
        enum CodingKeys: String, CodingKey {
            case value
            case unit
        }
    }
    
    struct Ingredients: Hashable, Decodable {
        let malt: [Malt]?
        let hops: [Hop]?
        let yeast: String?
        
        enum CodingKeys: String, CodingKey {
            case malt
            case hops
            case yeast
        }
    }
    
    struct Hop: Hashable, Decodable {
        let name: String?
        let amount: BoilVolume?
        let add: String?
        let attribute: String?
        
        enum CodingKeys: String, CodingKey {
            case name
            case amount
            case add
            case attribute
        }
    }
    
    struct Malt: Hashable, Decodable {
        let name: String?
        let amount: BoilVolume?
        
        enum CodingKeys: String, CodingKey {
            case name
            case amount
        }
    }
    
    struct Method: Hashable, Decodable {
        let mashTemp: [MashTemp]?
        let fermentation: Fermentation?
        let twist: String?
        
        enum CodingKeys: String, CodingKey {
            case mashTemp = "mash_temp"
            case fermentation
            case twist
        }
    }
    
    struct Fermentation: Hashable, Decodable {
        let temp: BoilVolume?
        
        enum CodingKeys: String, CodingKey {
            case temp
        }
    }
    
    struct MashTemp: Hashable, Decodable {
        let temp: BoilVolume?
        let duration: Int?
        
        enum CodingKeys: String, CodingKey {
            case temp
            case duration
        }
    }
}
