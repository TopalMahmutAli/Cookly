//
//  SearchBarView.swift
//  DesignSystem
//
//  Created by TOPAL Mahmut-Ali on 06/11/2025.
//

import SwiftUI
public struct SearchBarView: View {
    @Binding var text: String
    public var placeholder: String
    
    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .textFieldStyle(.plain)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            if !text.isEmpty {
                Button(action: { text = ""}){
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
