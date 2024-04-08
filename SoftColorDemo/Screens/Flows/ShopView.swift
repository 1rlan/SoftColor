//
//  ShopView.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColor

struct ShopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                SCImage(name: "text.justify")
                Spacer()
                SCImage(name: "magnifyingglass")
                Spacer()
                    .frame(width: 24)
                SCImage(name: "cart")
            }
            .padding(.horizontal, 16)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack {
                        Text("POPULAR TODAY")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("EDIT")
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    .padding(.horizontal, 16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            SCHeader(name: "scooter", text: "Scooters")
                            SCHeader(name: "beats.headphones", text: "Music")
                            SCHeader(name: "iphone.gen1", text: " Phones ")
                            SCHeader(name: "laptopcomputer", text: "Laptops")
                        }
                    }
                    .padding(.leading, 16)

                    SCDivider()
                        .padding(.horizontal, -16)

                    SCBanner(
                        mainColor: .white,
                        secondaryColor: .orange.opacity(0.8),
                        text: Text("Don't miss our sale!").fontWeight(.bold).font(.title2),
                        secondaryText: Text("Today only, you get 30% off when you buy $200 or more from items below!"),
                        shouldShowCloseButton: true,
                        cornerWidth: 2
                    )
                    .padding(.horizontal, 16)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: SCSpacing.medium) {
                            SCVerticalCardView(
                                mainColor: .white,
                                secondaryColor: Color(red: 32/255, green: 36/255, blue: 38/255),
                                image: Image("mavic"),
                                title: "Mavic",
                                subtitle: "$322.00",
                                desc: "$322.00"
                            )

                            SCVerticalCardView(
                                mainColor: .white,
                                secondaryColor: Color(red: 32/255, green: 36/255, blue: 38/255),
                                image: Image("alisa"),
                                title: "Alisa",
                                subtitle: "$228.00",
                                desc: "$228.00"
                            )

                            SCVerticalCardView(
                                mainColor: .white,
                                secondaryColor: Color(red: 32/255, green: 36/255, blue: 38/255),
                                image: Image("pods"),
                                title: "AirPods Max",
                                subtitle: "$323.00",
                                desc: "$123.00",
                                cornerWidth: 10
                            )

                            Spacer().frame(width: 1)

                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.right")
                            }
                            .frame(width: 68, height: 68)

                            Spacer().frame(width: 1)
                        }
                        .padding(8)
                        .frame(height: 280)
                    }
                    .padding(.leading, 16)
                    .shadow(radius: 5)


                    HStack {
                        Text("Special for you")
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(.horizontal, 16)

                    VStack(spacing: 16) {
                        SCHorizontalCard(
                            mainColor: .orange,
                            secondaryColor: .white,
                            image: Image("avp"),
                            title: "Vision Pro",
                            subtitle: "Apple",
                            desc: "$3000.00",
                            cornerRadius: .large,
                            cornerWidth: 1
                        )

                        SCHorizontalCard(
                            mainColor: .orange,
                            secondaryColor: .white,
                            image: Image("ds"),
                            title: "Docker Station",
                            subtitle: "Xiaomi",
                            desc: "$123.00",
                            cornerRadius: .large,
                            cornerWidth: 1
                        )

                        SCHorizontalCard(
                            mainColor: .orange,
                            secondaryColor: .white,
                            image: Image("kb"),
                            title: "Keyboard",
                            subtitle: "Logitech",
                            desc: "$123.00",
                            cornerRadius: .large,
                            cornerWidth: 1
                        )
                    }.padding(.horizontal, 16)
                }

                Spacer()
                    .frame(height: 60)
            }
        }
        .padding(.vertical, 16)
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar(.hidden, for: .tabBar)
    }

    private func SCHeader(name: String, text: String) -> some View {
        VStack {
            Image(systemName: name)
                .resizable()
                .scaledToFit()
            Spacer().frame(height: 14)
            Text(text)
        }
        .padding()
        .frame(width: 100, height: 100)
        .cornerRadiusWithBorder(borderColor: .orange, radius: .medium)
    }

    private func SCImage(name: String) -> some View {
        Image(systemName: name)
            .resizable()
            .frame(width: 24.0, height: 24.0)
    }
}

#Preview {
    ShopView()
}
