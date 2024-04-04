//
//  ContentView.swift
//  luaExample
//
//  Created by 0x67 on 2024-04-04.
//

import SwiftUI

/// Example view to demostrate lua basic functionality by returning a lua string "Hello World from lua!"
struct ContentView: View {
  
  var body: some View {
    Text(labelTextFromLua())
      .frame(minWidth: 200)
  }
  
}

#Preview {
  ContentView()
}
