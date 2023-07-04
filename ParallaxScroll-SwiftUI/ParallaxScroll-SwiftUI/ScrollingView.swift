//
//  ScrollingView.swift
//  ParallaxScroll-SwiftUI
//
//  Created by edy on 2023/7/4.
//

import SwiftUI

struct ScrollingView: View {
    
    var width: CGFloat = UIScreen.main.bounds.width
    var height: CGFloat = UIScreen.main.bounds.height
    
    var topMargin: CGFloat = 400
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { reader in
                if reader.frame(in: .global).minY > -topMargin {
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + topMargin)
                }
            }
            .frame(height: topMargin)
            
            DetailView()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct DetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
            
            HStack(spacing: 15) {
                ForEach(1...5, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            
            Text(desc)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.top, 5)
            
            Text(info)
                .padding(.top, 10)
                .foregroundColor(.white)
            
            HStack(spacing: 15) {
                Button(action: {}) {
                    Text("订阅")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {}) {
                    Text("买票")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 25)
        }
        .padding(.top, 25)
        .padding(.horizontal)
        .background(Color.black)
        .cornerRadius(20)
        .offset(y: -35)
    }
}

var info = """
非洲象属的耳朵非常大，上下可长达1.5米。前足五蹄、后足三蹄，有21对肋骨和最多26个尾椎骨。非洲象的前额突起，背部更加倾斜，肩部是最高点，鼻端有两个指状突，雌、雄均有长獠牙，但雌性的小得多。非洲象体长5-7.5米，尾长1-1.3米，肩高2.6-4米，体重范围从2吨到7.3吨。大部分非洲象体重为2.7-6.0吨之间，雌性比雄性小。非洲安哥拉一头雄象净重13.5吨是发现最大个体的非洲象。

非洲象是现存陆生哺乳动物中体型最大的，比亚洲象稍大，可以通过大如蒲扇的耳朵将其同亚洲象区分开来。亚洲象耳朵更圆、更小。大象的耳朵可以散发热量，保持身体凉爽，但有时非洲大陆的温度实在太高了，所以非洲象需要非常大的耳朵散热。大象对水有一种与生俱来的亲切感，喜欢将水吸入象鼻，然后喷到全身。之后，它们常常会给皮肤喷上一层具有保护作用的泥土。

大象长长的鼻子不仅可用来闻味、呼吸、吹号、喝水，还能用来抓东西，尤其是美餐。单单象鼻就有大约10万块肌肉。非洲象长鼻末端有2个指状突起，非常敏感和灵巧，可以用来抓小东西，亚洲象仅有一个。雄性和雌性非洲象都有长牙，去寻找食物和水，将树皮从树干上撕下来
"""

var desc = "非洲象属（学名：Loxodonta）：是长鼻目、象科的一个属"

var title = "大象"

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingView()
    }
}
