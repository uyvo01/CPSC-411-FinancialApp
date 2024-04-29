//  Modifiers.swift
//  CrosswalkSearch
//
//
//

import Foundation
import SwiftUI

struct TextEntry: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .border(Color.black)
            .background(Color.white)
    }
}

struct TextLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 80, alignment: .trailing)
            .padding(.leading, 10)
            .foregroundColor(Color.white)
    }
}

struct TextBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, alignment: .trailing)
            .padding(.leading, 5)
            .background(Color.white)
    }
}

struct RoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(10)
    }
}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(RoundedBackground())
            .foregroundColor(Color.white)
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Courier New", size: 20))
            .foregroundColor(Color.white)
            .padding(10)
            .background(Color.black)
            .cornerRadius(10)
        
    }
}
