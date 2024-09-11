//
//  UpbitSearchView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/10/24.
//

import SwiftUI

struct UpbitSearchView: View {
    
    @State private var searchText = ""
    @State private var market: Markets = []
    @State private var starredMarkets: Set<String> = []  // 선택된 마켓의 상태 저장
    
    var body: some View {
        NavigationView {
            listView()
                .navigationTitle("Search")
        }
        .searchable(text: $searchText)
        .task {
            do {
                let result = try await UpbitAPI.fetchMarket()
                market = result
            } catch {
                // 에러 처리
            }
        }
    }
    
    // 목록 뷰
    func listView() -> some View {
        List {
            ForEach(market, id: \.self) { item in
                rowView(item)  // 각 Market 항목에 대해 rowView 표시
            }
        }
    }
    
    // 각 row에 대한 뷰
    func rowView(_ item: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.englishName)
                    .font(.headline)
                Text(item.market)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                toggleStar(for: item)  // 버튼 눌렀을 때 상태 변경
            }) {
                Image(systemName: isStarred(item) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 5)
    }
    
    // 선택된 마켓의 상태 변경
    func toggleStar(for market: Market) {
        if starredMarkets.contains(market.market) {
            starredMarkets.remove(market.market)
        } else {
            starredMarkets.insert(market.market)
        }
    }
    
    // 해당 마켓이 선택된 상태인지 확인
    func isStarred(_ market: Market) -> Bool {
        return starredMarkets.contains(market.market)
    }
}

#Preview {
    UpbitSearchView()
}
