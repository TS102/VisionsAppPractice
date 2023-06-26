//
//  Model.swift
//  VisionsAppTest
//
//  Created by Tyler Sun on 6/26/23.
//

import Foundation


class recognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}

class TextItem: Identifiable {
    var id: String
    // stores reconized texts into a string from the id variable
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
}
