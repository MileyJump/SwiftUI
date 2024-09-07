//
//  NetflixBackground.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/7/24.
//

import Foundation
import SwiftUI

struct NetflixBackground: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
//            .foregroundStyle(.white)
            .cornerRadius(10)
    }
    
}

struct NetflixForeground: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}

extension View {
    
    func asNetflixBackground(color: Color) -> some View {
        modifier(NetflixBackground(color: color))
    }
    
    func asNetflixForeground(color: Color) -> some View {
        modifier(NetflixForeground(color: color))
    }
}
