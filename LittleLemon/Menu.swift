//
//  Menu.swift
//  LittleLemon
//
//  Created by Carlos Martínez on 01/08/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Little Lemon is a local mediterranean restaurant")
            List {
                
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
