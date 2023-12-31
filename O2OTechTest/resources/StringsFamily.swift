//
//  StringsFamily.swift
//  O2OTechTest
//
//  Created by Manuel Vera Trinidad on 31/12/23.
//

import Foundation

public enum StringsFamily {
    public static let search = "Search..."
    public static func numberOfBeers(number: Int) -> String {
        return number == 1 ? "\(number) beer" : "\(number) beers"
    }
    
    public enum ImageStrings {
        public static let detailArrow = "detail_arrow"
        public static let beerPlaceholder = "beer_placeholder"
        public static let finder = "finder"
    }
}
