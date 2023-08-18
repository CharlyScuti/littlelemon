//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Carlos Martínez on 01/08/23.
//

import SwiftUI

let kFirstName = "kFirstName"
let kLastName = "kLastName"
let kEmail = "kEmail"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var showingAlert = false
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Logo")
                    .padding(.bottom, 20)
                TextField("First name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                Button {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        showingAlert = true
                        return
                    }
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    isLoggedIn = true
                } label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(GrowingButton())
                .padding(.top, 20)
                .alert("Plase fill all data", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .padding(.horizontal, 20)
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
