//
//  TossView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/6/24.
//

import SwiftUI

struct TossView: View {
    
    private var cardView: some View {
        VStack {
            Image(systemName: "star")
            Text("토스뱅크")
        }
        .padding()
        .background(.black.opacity(0.1))
        
    }
    
    private func topView(image: String, text: String) -> some View {
        VStack(spacing: 10) {
            Image(systemName: image)
            Text(text)
        }
        .padding()
        .background(.blue.opacity(0.4))
    }
    
    var body: some View {
        HStack{
            topView(image: "person", text: "고객센터")
            topView(image: "xmark", text: "문의하기")
            topView(image: "bookmark", text: "북마크")
        }
        
        HStack {
            cardView
            cardView
            cardView
        }
        
        VStack {
            ExtractedView(image: "star", text: "새로운 이벤트")
            ExtractedView(image: "star", text: "새로운 이벤트")
            ExtractedView(image: "star", text: "새로운 이벤트")
            
        }
     
    }
}

#Preview {
    TossView()
}

private struct ExtractedView: View {
    let image: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
        
}
