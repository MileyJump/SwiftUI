//
//  UpbitSearchView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/10/24.
//

import SwiftUI

struct UpbitSearchView: View {
    
    @State private var searchText = ""
    @State private var market: Markets = [ ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Item 1")
                Text("Item 1")
                Text("Item 1")
            }
        }
        .searchable(text: $searchText)
        
        do {
            let result = try await
            UpbitAPI.fetchMarket()
        }
    }
    
    func rowView(_ item: Market) -> some View {
        List {
            ForEach(item.koreanName) { item in
                
            }
        }
    }
    
    func listView() -> some View {
        List {
            ForEach(market, id: \.self) { item in
                
                
            }
        }
    }
}

#Preview {
    UpbitSearchView()
}
