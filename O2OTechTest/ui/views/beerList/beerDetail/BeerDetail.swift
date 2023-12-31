//
//  BeerDetail.swift
//  O2OTechTest
//
//  Created by Manuel Vera Trinidad on 31/12/23.
//

import SwiftUI

struct BeerDetail: View {
    let item: BeerListModel.Beer
    
    var body: some View {
        NavigationView {
            VStack {
                content
                    .frame(maxHeight: .infinity)
            }
            .navigationBarTitle("")
        }
        .navigationBarTitle(item.name ?? "")
    }
    
    @ViewBuilder
    var content: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                AsyncImage(url: URL(string: item.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                } placeholder: {
                    Image(StringsFamily.ImageStrings.beerPlaceholder)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Divider()
                Text(item.name?.capitalized ?? "")
                    .font(.custom(FontFamily.SFProDisplay.bold, size: 26))
                    .foregroundColor(Color(ColorFamily.CFBlack))
                Text(item.tagline?.capitalized ?? "")
                    .font(.custom(FontFamily.SFProDisplay.bold, size: 20))
                    .foregroundColor(Color(ColorFamily.CFBlack))
                Text(item.description?.capitalized ?? "")
                    .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                    .foregroundColor(Color(ColorFamily.CFDarkGray))
                Text((item.firstBrewed?.capitalized) ?? "")
                    .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                    .foregroundColor(Color(ColorFamily.CFDarkGray))
                
                VStack(alignment: .leading) {
                    if let abv = item.abv {
                        Text("Alcohol by volume: \(String(format: "%.1f", abv))")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                    }
                    if let ibu = item.ibu {
                        Text("Internationar bitterness units: \(String(format: "%.1f", ibu))")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                    }
                    if let ph = item.ph {
                        Text("pH: \(String(format: "%.1f", ph))")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                    }
                }
                
                if let ingredients = item.ingredients, let malts = ingredients.malt, let hops = ingredients.hops, let yeast = ingredients.yeast {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ingredients: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        Text("\tMalts: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        ForEach(malts, id: \.self) { malt in
                            if let name = malt.name, let amount = malt.amount, let value = amount.value, let unit = amount.unit {
                                Text("\t\t-\(name) \(String(format: "%.1f", value)) \(unit)")
                                    .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                                    .foregroundColor(Color(ColorFamily.CFDarkGray))
                            }
                        }
                        Text("\tHops: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        ForEach(hops, id: \.self) { hop in
                            if let name = hop.name, let amount = hop.amount, let value = amount.value, let unit = amount.unit, let add = hop.add, let attribute = hop.attribute {
                                Text("\t\t-\(name) \(String(format: "%.1f", value)) \(unit)")
                                    .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                                    .foregroundColor(Color(ColorFamily.CFDarkGray))
                                Text("\t\t\tAdd: \(add.capitalized)")
                                    .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                                    .foregroundColor(Color(ColorFamily.CFDarkGray))
                                Text("\t\t\tAttribute: \(attribute.capitalized)")
                                    .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                                    .foregroundColor(Color(ColorFamily.CFDarkGray))
                            }
                        }
                        Text("Yeast: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        Text("\t\(yeast)")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                    }
                }
                
                if let foodPairing = item.foodPairing {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Food Pairing: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        ForEach(foodPairing, id: \.self) { pairing in
                            Text("- \(pairing)")
                                .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                                .foregroundColor(Color(ColorFamily.CFDarkGray))
                        }
                    }
                }
                
                if let brewersTips = item.brewersTips {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Brewers Tips: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        Text("\(brewersTips)")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                    }
                }
                
                if let contributedBy = item.contributedBy {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Contributed By: ")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                        Text("\(contributedBy)")
                            .font(.custom(FontFamily.SFProDisplay.bold, size: 16))
                            .foregroundColor(Color(ColorFamily.CFDarkGray))
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    BeerDetail(item: BeerListModel.Beer(id: 1,
                                        name: "Buzz",
                                        tagline: "A Real Bitter Experience.",
                                        firstBrewed: "09/2007",
                                        description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
                                        imageURL: "beer_placeholder",
                                        abv: 4.5,
                                        ibu: 60,
                                        targetFg: nil,
                                        targetOg: nil,
                                        ebc: nil,
                                        srm: nil,
                                        ph: 4.4,
                                        attenuationLevel: 75,
                                        volume: BeerListModel.BoilVolume(value: 20, unit: "litres"),
                                        boilVolume: BeerListModel.BoilVolume(value: 25, unit: "litres"),
                                        method: nil,
                                        ingredients: BeerListModel.Ingredients(malt: [BeerListModel.Malt(name: "Maris Otter Extra Pale", amount: BeerListModel.BoilVolume(value: 3.3, unit: "kilograms")),
                                                                                      BeerListModel.Malt(name: "Caramalt", amount: BeerListModel.BoilVolume(value: 0.2, unit: "kilograms"))],
                                                                               hops: [BeerListModel.Hop(name: "Fuggles", amount: BeerListModel.BoilVolume(value: 25, unit: "grams"), add: "start", attribute: "bitter"),
                                                                                      BeerListModel.Hop(name: "First Gold", amount: BeerListModel.BoilVolume(value: 25, unit: "grams"), add: "start", attribute: "bitter")],
                                                                               yeast: "Wyeast 1056 - American Ale™"),
                                        foodPairing: ["Poached sole fillet with capers", "Summer fruit salad", "Banana split"],
                                        brewersTips: "The earthy and floral aromas from the hops can be overpowering. Drop a little Cascade in at the end of the boil to lift the profile with a bit of citrus.",
                                        contributedBy: "Sam Mason <samjbmason>"))
}
