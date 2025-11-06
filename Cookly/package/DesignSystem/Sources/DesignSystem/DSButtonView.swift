//
//  DSButtonView.swift
//  DesignSystem
//
//  Created by TOPAL Mahmut-Ali on 06/11/2025.
//

import SwiftUI

public struct DSButtonView: View {
    public var title: String
    public var action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
        }
    }
}
