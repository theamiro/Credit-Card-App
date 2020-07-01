//
//  ContentView.swift
//  Credit Card
//
//  Created by Michael Amiro on 01/07/2020.
//  Copyright © 2020 Michael Amiro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DebitCardFrontView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().background(Color.white)
    }
}

struct DebitCardFrontView: View {
    @State var flippedTop = false
    @State var flippedBottom = false
    var body: some View {
        ZStack() {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack() {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                    Image("blued")
                        .resizable()
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                    
                    VStack(alignment: .leading) {
                        Image("kcb-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200.0)
                        Spacer()
                            .frame(height: 50.0)
                        VStack(alignment: .leading){
                            //            •
                            Text("5560 0000 0000 0000")
                                .font(.custom("Courier", size: 24.0))
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 20.0)
                            Text("5560")
                                .font(.custom("Courier", size: 12.0))
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 20.0)
                        }
                        HStack(alignment: .center, spacing: 0) {
                            Text("JOHN DOE").kerning(5)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .autocapitalization(.allCharacters)
                                .font(.custom("Avenir Next", size: 14.0))
                            Spacer()
                            VStack() {
                                Text("VALID THRU")
                                    .fontWeight(.light)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .autocapitalization(.allCharacters)
                                    .font(.custom("Avenir Next", size: 8.0))
                                Text("12/26")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .autocapitalization(.allCharacters)
                                    .font(.custom("Avenir Next", size: 18.0))
                            }
                            Spacer()
                            Image("mastercard-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60.0)
                        }
                        .padding(.horizontal, 20.0)
                    }
                }
                .rotation3DEffect(self.flippedTop ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                .animation(.default)
                .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                .onTapGesture {
                    self.flippedTop.toggle()
                }
                .shadow(radius: 5.0)
                Spacer()
                    .frame(height: 20.0)
                ZStack(){
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                    Image("blued")
                        .resizable()
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                    
                    VStack(alignment: .leading) {
                        Text("Card helpline 0711 087 000")
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .autocapitalization(.allCharacters)
                            .font(.custom("Avenir Next", size: 8.0))
                            .padding(.top, 5)
                            .padding(.leading, 20)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 50.0)
                        HStack() {
                            Text("AUTHORIZED SIGNATURE")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .autocapitalization(.allCharacters)
                                .font(.custom("Avenir Next", size: 8.0))
                            Spacer()
                            Text("CVV")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .autocapitalization(.allCharacters)
                                .font(.custom("Avenir Next", size: 8.0))
                            Text("https://kcbgroup.co.ke")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .autocapitalization(.allCharacters)
                                .font(.custom("Avenir Next", size: 8.0))
                        }
                        .padding(.horizontal, 20.0)
                        HStack(alignment: .top, spacing: 0) {
                            ZStack(alignment: .leading) {
                                Image("signature").resizable().aspectRatio(contentMode: .fill).frame(width: 230.0, height: 32.0).clipped()
                                HStack(alignment: .top) {
                                    Image("signature-muh").resizable().aspectRatio(contentMode: .fit).frame(height: 32.0).padding(.horizontal, 20.0)
                                    Spacer()
                                    Text("000")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(1)
                                        .autocapitalization(.allCharacters)
                                        .font(.custom("Avenir Next", size: 10.0)).padding(.horizontal, 10.0).padding(.top, 3.0)
                                }.frame(width: 230.0, height: 32.0)
                                
                            }.padding(.leading, 20.0)
                            ZStack() {
                                Image("signature").resizable().aspectRatio(contentMode: .fill).frame(width: 30.0, height: 20.0).clipped().opacity(0.95)
                                Text("392")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .autocapitalization(.allCharacters)
                                    .font(.custom("Avenir Next", size: 10.0)).padding(.horizontal, 0.0)
                            }
                            Spacer()
                        }
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec blandit quam metus. Vestibulum posuere quam eu ante pellentesque sagittis. Nulla ac suscipit lorem. Cras in iaculis augue, vitae dignissim elit. Mauris ornare, orci id bibendum egestas, erat nisl gravida metus, at maximus ex risus eu ex.")
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .autocapitalization(.allCharacters)
                            .font(.custom("Avenir Next", size: 8.0))
                            .padding(.horizontal, 20.0)
                            .padding(.top, 0.0)
                        Text("This is property of Michael Amiro, if lost, contact 0711 087 000 or 999, or report to the nearest police station.")
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .autocapitalization(.allCharacters)
                            .font(.custom("Avenir Next", size: 6.0))
                            .padding(.horizontal, 20.0)
                            .padding(.top, 10.0)
                    }
                    .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                }
                .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                .rotation3DEffect(self.flippedBottom ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                .animation(.default)
                .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                .onTapGesture {
                    self.flippedBottom.toggle()
                }
                .shadow(radius: 5.0)
            }
        }
    }
    
}
