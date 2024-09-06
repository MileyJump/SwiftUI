//
//  GenreSeletedView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/6/24.
//

import SwiftUI


struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct GenreSeletedView: View {
    
    @State var text = ""
    
    @State var category = [
        Category(name: "스릴러", count: 4),
        Category(name: "SF", count: 64),
        Category(name: "액션", count: 10),
        Category(name: "액션", count: 10),
        Category(name: "로맨스", count: 34),
    ]
    
    
    var body: some View {
        VStack {
            TextField("장르를 입력해주세요", text: $text)
                .padding()
            Button("추가하기") {
                let item = Category(name: text, count: .random(in: 1...100))
                category.append(item)
                
            }
            .padding()
            .background(.gray)
            .foregroundStyle(.white)
            
            GenreListView(category: $category)
        }
    }
}
    
    #Preview {
        GenreSeletedView()
    }


struct GenreListView: View {
    
    @Binding var category: [Category]
    
    var body: some View {
        List(category, id: \.self) { item in
            Text("\(item.name)-\(item.count)")
        }
        .font(.largeTitle)
        .background(.gray)
    }
}
