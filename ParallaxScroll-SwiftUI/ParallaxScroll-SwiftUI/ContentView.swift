//
//  ContentView.swift
//  ParallaxScroll-SwiftUI
//
//  Created by edy on 2023/7/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 横向向滚动视差
       ParallaxView()
        // 竖向滚动视差
//        ScrollingView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
