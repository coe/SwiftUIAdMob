//
//  ContentView.swift
//  SwiftUIAdMob
//
//  Created by 日向 強 on 2021/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ContainedAdViewController(rootView:
                                    Text("Hello, world!").padding()
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
