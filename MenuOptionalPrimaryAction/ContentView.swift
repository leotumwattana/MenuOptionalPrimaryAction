//
//  ContentView.swift
//  MenuOptionalPrimaryAction
//
//  Created by Leo Tumwattana on 13/7/2023.
//

/**
 # SwiftUI Feature Request - Allow providing optional primaryAction to Menu
 
 I have a certain use case where based on certain conditions, a bunch of `Menu` should allow triggering via `primaryAction` or not.
 
 Right now, based on the current **SwiftUI.Menu API**, I have to use an `if` clause to switch between these behaviors. However, when
 the number of Menus are large, this is very **inefficient** as it'll have to render anew.
 
 I would like to propose allowing us to set primaryAction as an optional value for this use case:
 
 `Menu(titleKey: LocalizedStringKey, content: () ->, View: (() -> Void)?)`
 */

import SwiftUI

struct ContentView: View {
    
    @State private var isPrimaryActionEnabled: Bool = true
    @State private var color: Color = Color.random
    
    var body: some View {
        VStack(spacing: 32) {
            Toggle("Primary Action Enabled", isOn: $isPrimaryActionEnabled)
            
            if isPrimaryActionEnabled {
                Menu {
                    Button(action: {
                        color = .random
                    }) {
                        Label("Toggle color", systemImage: "swatchpalette")
                    }
                    Button(action: {
                        color = .blue
                    }) {
                        Label("Make blue", systemImage: "paintpalette")
                    }
                } label: {
                    Text("Toggle Color - Primary Action Enabled")
                } primaryAction: {
                    color = .random
                }

            } else {
                Menu {
                    Button(action: {
                        color = .random
                    }) {
                        Label("Toggle color", systemImage: "swatchpalette")
                    }
                    Button(action: {
                        color = .blue
                    }) {
                        Label("Make blue", systemImage: "paintpalette")
                    }
                } label: {
                    Text("Primary action disabled")
                }

            }
            
            color
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
