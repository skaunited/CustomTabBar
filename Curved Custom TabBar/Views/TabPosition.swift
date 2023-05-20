//
//  TabPosition.swift
//  Curved Custom TabBar
//
//  Created by Work Flow Dev on 20/05/2023.
//

import SwiftUI

/// Custom View Extenstion
/// Which will return view position
struct TabPositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    
                    Color.clear
                        .preference(key: TabPositionKey.self, value: rect)
                        .onPreferenceChange(TabPositionKey.self, perform: completion)
                    
                }
            }
    }
}
