//
//  BeerListView+Cell.swift
//  O2OTechTest
//
//  Created by Manuel Vera Trinidad on 30/12/23.
//

import SwiftUI

extension BeerListView {
    struct Cell: View {
        
        let item: BeerListModel.Beer
        
        var body: some View {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: item.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 106.6, height: 85.3)
                } placeholder: {
                    Image(StringsFamily.ImageStrings.beerPlaceholder)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 106.6, height: 85.3)
                        .background {
                            Rectangle()
                                .fill(.gray)
                                .frame(width: 106.6, height: 85.3)
                        }
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(item.name?.capitalized ?? "")
                        .font(.custom(FontFamily.SFProDisplay.bold, size: 14))
                        .foregroundColor(Color(ColorFamily.CFBlack))
                    Text(item.tagline ?? "")
                        .font(.custom(FontFamily.SFProDisplay.regular, size: 12))
                        .foregroundColor(Color(ColorFamily.CFDarkGray))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    if let foodPairing = item.foodPairing {
                        ForEach(foodPairing, id: \.self) { pairing in
                            Text(pairing)
                                .font(.custom(FontFamily.SFProDisplay.regular, size: 11))
                                .foregroundColor(Color(ColorFamily.CFDarkGray))
                        }
                    }
                    Spacer()
                }
                Spacer()
                Image(StringsFamily.ImageStrings.detailArrow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
            }
            .padding(.vertical, 8)
            .padding(.leading, 8)
            .padding(.trailing, 16)
            .frame(height: 106.6)
            Divider()
        }
    }
}

// MARK: - Preview
#Preview {
    BeerListView.Cell(item: BeerListModel.Beer(id: 1, name: "Buzz", tagline: "Spiced Wheat Beer.", firstBrewed: nil, description: nil, imageURL: "beer_placeholder", abv: nil, ibu: nil, targetFg: nil, targetOg: nil, ebc: nil, srm: nil, ph: nil, attenuationLevel: nil, volume: nil, boilVolume: nil, method: nil, ingredients: BeerListModel.Ingredients(malt: nil, hops: nil, yeast: "Wyeast 1056 - American Ale™") , foodPairing: ["Poached sole fillet with capers", "Summer fruit salad", "Banana split"], brewersTips: nil, contributedBy: nil))
}
