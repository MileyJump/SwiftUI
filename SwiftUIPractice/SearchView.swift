//
//  SearchView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text = ""
    let list = ["Bitcoin", "Ethereum", "Ripple", "Litecoin", "Ravencoin"]
    
    var filterUser: [String] {
        return text.isEmpty ? list : list.filter { $0.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterUser, id: \.self) { item in
                    
                    NavigationLink {
                        SearchDetailView(data: item)
                    } label: {
                        Text("Asdf \(item)")
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $text, placement: .navigationBarDrawer, prompt: "Search")
        }   
    }
}

#Preview {
    SearchView()
}

struct SearchDetailView: View {
    
    let data: String
    
    var body: some View {
        Text("SearchDetailView \(data)")
        Button("클릭") {
            
        }
    }
    
    init(data: String) {
        self.data = data
        print("SearchDetailView \(data)")
    }
}
