//
//  BeerListView.swift
//  O2OTechTest
//
//  Created by Manuel Vera Trinidad on 30/12/23.
//

import SwiftUI

struct BeerListView: View {
    @StateObject var viewModel: BeerListViewModel = BeerListViewModel()

    @FocusState var isFocused: Bool
    @State var showDetail: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                content
                    .frame(maxHeight: .infinity)
                    .onTapGesture {
                        isFocused = false
                    }
                navigationLink()
            }.onAppear {
                viewModel.loadViewModel()
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 4) {
                ZStack {
                    TextField("", text: $viewModel.finderValue)
                        .padding(.leading, 6)
                        .focused($isFocused)
                    HStack(spacing: 2) {
                        if viewModel.finderValue == "" {
                            Image(StringsFamily.ImageStrings.finder)
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(StringsFamily.search)
                                .font(.custom(FontFamily.SFProDisplay.regular, size: 14))
                                .foregroundColor(Color(ColorFamily.CFGray))
                                
                        }
                        Spacer()
                    }
                    .padding(.leading, 8)
                    .frame(height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .allowsHitTesting(false)
                }
                Spacer()
                Text(StringsFamily.numberOfBeers(number: viewModel.filteredBeers.count))
                    .font(.custom(FontFamily.SFProDisplay.regular, size: 15))
                    .foregroundColor(.yellow)
            }
            .padding(.trailing, 14)
            .padding(.leading, 4)
            .background(.white)
            Divider()
                .padding(.vertical, 12)
                .background(.white)
            ScrollView {
                VStack(spacing: 6) {
                    ForEach(viewModel.filteredBeers, id: \.self) { beer in
                        BeerListView.Cell(item: beer)
                            .onTapGesture {
                                showDetail.toggle()
                                viewModel.selectedBeer = beer
                            }
                    }
                }
            }
            .onChange(of: viewModel.finderValue) { newValue in
                viewModel.filterResults()
            }
        }
    }
}

extension BeerListView {
    private func navigationLink() -> some View {
        Group {
            NavigationLink(isActive: $showDetail) {
                if let selectedBeer = viewModel.selectedBeer {
                    BeerDetail(item: selectedBeer)
                }
            } label: {
                EmptyView()
            }
        }
        .hidden()
    }
}

// MARK: - Preview
#Preview {
    BeerListView()
}
