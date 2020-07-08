//
//  ContentView.swift
//  Credit Card
//
//  Created by Michael Amiro on 01/07/2020.
//  Copyright © 2020 Michael Amiro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var transactions: [Transaction] = [
        Transaction(id: 1, receipient: "Michael Doe", amount: "3000.00", dateTime: "TUE 29/04/20 at 0900hrs", cardNumber: "nil", type: .income),
        Transaction(id: 2, receipient: "Sonny Doe", amount: "3625.00", dateTime: "MON 28/04/20 at 0846hrs", cardNumber: "6453", type: .expense),
        Transaction(id: 3, receipient: "Sonny Doe", amount: "355.00", dateTime: "THUR 28/03/20 at 0059hrs", cardNumber: "nil", type: .income),
        Transaction(id: 4, receipient: "KCB Bank", amount: "5543.00", dateTime: "WED 04/03/20 at 0437hrs", cardNumber: "6453", type: .expense),
        Transaction(id: 5, receipient: "Joe Doe", amount: "66436.00", dateTime: "FRI 28/08/19 at 1540hrs", cardNumber: "nil", type: .income)]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20.0) {
                ListofCardsScrollView()
                Text("Recent Transactions").font(.custom("Avenir Next", size: 24.0)).fontWeight(.semibold).padding(.horizontal, 20.0)
                List(transactions) { transaction in
                    NavigationLink(destination: TransactionDetail()) {
                        TransactionRow(transaction: transaction)
                    }
                }
                Spacer()
            }
            .navigationBarTitle("Bank Cards")
            .navigationBarItems(trailing: AddCardViewItem())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DebitCardFrontView: View {
    var card: Card!
    @State var flippedTop = false
    var body: some View {
        ZStack() {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                
                if card.type == CardType.platinum {
                    Image("blued")
                        .resizable()
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                } else {
                    Image("background-blue")
                        .resizable()
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                }
                
                VStack(alignment: .leading) {
                    Image("kcb-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200.0)
                    Spacer()
                        .frame(height: 50.0)
                    VStack(alignment: .leading){
                        //            •
                        Text(maskNumber(string: card.number))
                            .font(.custom("Courier", size: 24.0))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                        Text(card.number.prefix(4))
                            .font(.custom("Courier", size: 12.0))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20.0)
                    }
                    HStack(alignment: .center, spacing: 0) {
                        Text(card.name.uppercased()).kerning(5)
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
                            Text(card.expiry)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .autocapitalization(.allCharacters)
                                .font(.custom("Avenir Next", size: 18.0))
                        }
                        Spacer()
                        if card.provider == Provider.masterCard {
                            Image("mastercard-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60.0)
                        } else {
                            Image("visa-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60.0)
                        }
                    }
                    .padding(.horizontal, 20.0)
                }
            }
            .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
            .rotation3DEffect(self.flippedTop ? Angle(degrees: 180) : Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(1.0), z: CGFloat(0)))
            .zIndex(self.flippedTop ? 0 : 1)
            
            
            ZStack(){
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                if card.type == CardType.platinum {
                    Image("blued")
                        .resizable()
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                        .rotation3DEffect(self.flippedTop ? Angle(degrees: 180) : Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(-1.0), z: CGFloat(0)))
                } else {
                    Image("background-blue")
                        .resizable()
                        .frame(minWidth: 350.0, idealWidth: 350.0, maxWidth: 350.0, minHeight: 200.0, idealHeight: 200.0, maxHeight: 200.0, alignment: .topLeading)
                        .rotation3DEffect(self.flippedTop ? Angle(degrees: 180) : Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(-1.0), z: CGFloat(0)))
                }
                
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
                            Text(card.cvv)
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
            .rotation3DEffect(self.flippedTop ? Angle(degrees: 0) : Angle(degrees: 180), axis: (x: CGFloat(0), y: CGFloat(-1.0), z: CGFloat(0)))
            .zIndex(self.flippedTop ? 1 : 0)
        }
        .onTapGesture {
            self.handleFlipViewTap()
        }
        .animation(.none)
    }
    private func handleFlipViewTap() -> Void
    {
        withAnimation(.easeOut(duration: 0.25)) {
            self.flippedTop.toggle()
        }
    }
    private func maskNumber(string: String) -> String {
        var newString: String = ""
        
        let trimmedString = string.trimmingCharacters(in: .whitespaces)
        let start = trimmedString.prefix(4)
        let end = trimmedString.suffix(4)
        
        newString.append(contentsOf: start + " ")
        for i in 5...12 {
            newString.append("•")
            if i % 4 == 0 {
                newString.append(" ")
            }
        }
        newString = "\(newString)\(end)"
        
        return newString
    }
    //    private mutating func maskCardNumber(string: String) -> String {
    //        for block in stride(from: 0, to: string.count - 1, by: 4) {
    //            print(block)
    //        }
    //
    //        return ""
    //    }
}

struct AddCardViewItem: View {
    var body: some View {
        Button(action: {
            // Actions
        }, label: {
            HStack(alignment: .center, spacing: 5.0) {
                Image(systemName: "plus").resizable().aspectRatio(contentMode: .fit).frame(width: 16.0, height: 16.0, alignment: .center)
                Text("Add Card").fontWeight(.semibold)
                    .font(.custom("Avenir Next", size: 17.0))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .lineSpacing(17.0)
            }
        })
            .foregroundColor(Color(red: 0/255, green: 61/255, blue: 76/255, opacity: 1.0))
    }
}

struct ListofCardsScrollView: View {
    var cardOne = Card(type: .platinum, number: "5693 8876 8909 6453", cvv: "438", name: "Jane Doe", expiry: "12/24", provider: .masterCard)
    var cardTwo = Card(type: .regular, number: "6473 8876 6474 8748", cvv: "098", name: "Jane Doe", expiry: "08/30", provider: .visa)
    var cardThree = Card(type: .platinum, number: "5693 3783 8909 2784", cvv: "048", name: "Jane Doe", expiry: "02/23", provider: .masterCard)
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                DebitCardFrontView(card: cardOne)
                DebitCardFrontView(card: cardTwo)
                DebitCardFrontView(card: cardThree)
            }.padding(.horizontal, 20)
        }.frame(height: 220.0)
    }
}

class Card {
    var type: CardType = .regular
    var number: String = ""
    var cvv: String = ""
    var name: String = ""
    var expiry: String = ""
    var provider: Provider = .masterCard
    
    init(type: CardType, number: String, cvv: String, name: String, expiry: String, provider: Provider) {
        self.type = type
        self.number = number
        self.cvv = cvv
        self.name = name
        self.expiry = expiry
        self.provider = provider
    }
}

enum CardType: String {
    case platinum = "blued"
    case regular = "regular"
}
enum Provider: String {
    case visa = "visa-logo"
    case masterCard = "mastercard-logo"
}

struct Transaction: Hashable, Identifiable{
    var id: Int
    var receipient: String
    var amount: String
    var dateTime: String
    var cardNumber: String
    var type: TransactionType
}
enum TransactionType {
    case income
    case expense
}

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            if transaction.type == .expense {
                Image(systemName: "arrow.up").foregroundColor(.red).padding(.horizontal, 10.0)
            } else {
                Image(systemName: "arrow.down").foregroundColor(.green).padding(.horizontal, 10.0)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(transaction.receipient)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .autocapitalization(.allCharacters)
                    .font(.custom("Avenir Next", size: 16.0))
                Text(transaction.cardNumber)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .autocapitalization(.allCharacters)
                    .font(.custom("Avenir Next", size: 12.0))
                Text(transaction.dateTime)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .autocapitalization(.allCharacters)
                    .font(.custom("Avenir Next", size: 12.0))
            }
            Spacer()
            Text(transaction.amount)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
                .autocapitalization(.allCharacters)
                .font(.custom("Avenir Next", size: 18.0))
        }
    }
}

struct TransactionDetail: View {
    var body: some View {
        Text("Hello")
    }
}
