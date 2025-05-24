//
//  SecondView.swift
//  EnvironmentObject
//
//  Created by Uday Abhishek on 09/04/25.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var account: Account
    
    var body: some View {
        VStack {
            TextField("A/C balance", value: $account.balance, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Stepper("Balance \(account.balance)", value: $account.balance)
            
            NavigationLink("Navigate to third view", destination: ThirdView())
                .navigationTitle("Second View")
        }
        .padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            //.environmentObject(User())
            .environmentObject(Account())
    }
}
