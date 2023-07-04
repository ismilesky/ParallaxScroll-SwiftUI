//
//  ParallaxView.swift
//  ParallaxScroll-SwiftUI
//
//  Created by edy on 2023/7/4.
//

import SwiftUI

struct ParallaxView: View {
    /// 设置默认选中
    @State var index: Int = 1
    
    var width: CGFloat = UIScreen.main.bounds.width
    var height: CGFloat = UIScreen.main.bounds.height

    var body: some View {
        TabView(selection: $index) {
            ForEach(1...7, id: \.self) { index in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                    GeometryReader { reader in
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // offset x轴 将图片向相反方向偏移，以创建视差效果
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                    }
                    .frame(height: height / 2)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    // shadow 一个在右下方，一个在左上方
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                })
                .padding(.horizontal, 25)
            }
        }
        // 隐藏页面指示器
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
}


struct ParallaxView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxView()
    }
}
