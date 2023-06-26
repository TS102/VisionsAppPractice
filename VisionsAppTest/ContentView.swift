//
//  ContentView.swift
//  VisionsAppTest
//
//  Created by Tyler Sun on 6/26/23.
//

import SwiftUI

struct MainVision: View {
  var body: some View {
    ScannerView { text in
        print(text ?? "There is no text")
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainVision()
  }
}
