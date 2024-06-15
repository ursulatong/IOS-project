//
//  ParallaxCarouselView.swift
//  ParallaxCarousel
//
//  Created by Ka Yin Tong on 24/5/2024.
//

import SwiftUI

struct ParallaxCarouselView: View {
    
    let horizontalPadding: CGFloat = 30
    let cornerRadiusConstant: CGFloat = 10
    let paddingConstant: CGFloat = 10
    
    @State private var isNextPageActive = false
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Your Japan Guide")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .frame(height: 100)
                
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(carouselCards) { card in
                                GeometryReader(content: { proxy in
                                    let minX = min( proxy.frame(in: .scrollView).minX * 1.4, proxy.size.width  * 1.4)
                                    
                                    Image(card.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .offset(x: -minX)
                                        .frame(width: proxy.size.width * 2.5)
                                        .frame(width: proxy.size.width)
                                        .frame(height: proxy.size.height)
                                        .overlay(content: {
                                            titleOverlayForCard(card)
                                        })
                                        .clipShape(.rect(cornerRadius: cornerRadiusConstant))
                                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.5), radius: cornerRadiusConstant, x: -1, y: paddingConstant)
                                })
                                .frame(width: size.width - 2*horizontalPadding - 2*paddingConstant, height: size.height - horizontalPadding)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, horizontalPadding )
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                })
                
                
                
                NavigationView {
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            isNextPageActive = true
                        }) {
                            Text("Find the top 10 Prefectures")
                                .font(.title.bold())
                                .frame(height: 50)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $isNextPageActive) {
                            PrefectureList()
                                .navigationBarHidden(true)
                                .navigationBarTitle("")
                        }
                        .frame(height: 50)
                        
                        Spacer()
                    }
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .frame(maxHeight: 80)
                
                Spacer()
                
                
            }
        }
    }
    
    // Design for the card view
    @ViewBuilder
    private func titleOverlayForCard(_ card: CarouselCard) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black
            ], startPoint: .top, endPoint: .bottom)
            VStack(alignment: .leading , spacing: 5) {
                Text(card.title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                Text(card.subTitle)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.7))
            }
            .padding(paddingConstant)
        })
    }
}

#Preview {
    ParallaxCarouselView()
}
