//
//  DSTextFieldView.swift
//  DesignSystem
//
//  Created by TOPAL Mahmut-Ali on 06/11/2025.
//

import SwiftUI

public struct DSTextFieldView: View {
    @Binding var text: String
    public var placeholder: String
    
    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
