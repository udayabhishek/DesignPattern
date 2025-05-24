//
//  ThirdView.swift
//  EnvironmentObject
//
//  Created by Uday Abhishek on 09/04/25.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var account: Account
    
    var body: some View {
        Text("Logged in as: \(user.name) with rewrwer account balance \(account.balance)")
            .navigationBarTitle("Third View")
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environmentObject(User())
            .environmentObject(Account())
    }
}
