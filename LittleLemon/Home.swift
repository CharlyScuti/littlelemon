//
//  Home.swift
//  LittleLemon
//
//  Created by Carlos Martínez on 01/08/23.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 50.0, height: 50.0)
                    .foregroundColor(.clear)
                    .padding(.leading, 20)
                Spacer()
                Image("Logo")
                Spacer()
                NavigationLink(destination: UserProfile()) {
                    Image("profile-image-placeholder")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                }
                .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity)
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
