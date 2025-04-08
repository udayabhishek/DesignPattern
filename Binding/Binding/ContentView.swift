//
//  ContentView.swift
//  Binding
//
//  Created by Uday Abhishek on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            
            Text("Hello, world!")
                .font(.largeTitle)
                .fixedSize()
                .foregroundColor(isOn ? .blue : .black)
            
//            Toggle(isOn: $isOn, label: {
//                Text("is watching")
//            })
            ToggleChildView(isOn: $isOn)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//#Preview {
//    ContentView()
//}
