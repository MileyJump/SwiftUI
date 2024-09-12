//
//  RandomImageView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/12/24.
//

import SwiftUI

struct RandomImageView: View {
    var body: some View {
        NavigationView {
            
        }
    }
}

#Preview {
    RandomImageView()
}


struct HorizontalSectionView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack { //60개
                ForEach(0..<6) { item in
                    PosterView()
                }
            }
        }
        
    }
}

struct PosterView: View {
    
    let url = URL(string: "https://picsum.photos/200/300")
    
    var body: some View {
        AsyncImage(url: url) { data
            in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 300)
            case .success(let image):
                image
//                    .scaledToFit()
                    .frame(width: 200, height: 300)
//                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            case .failure(let error):
                Image(systemName: "star")
                    .frame(width: 200, height: 300)
            @unknown default:
                Image(systemName: "star")
            }
        }
