//
//  ContentView.swift
//  TipSplit
//
//  Created by William Hinson on 3/14/22.
//

import SwiftUI

enum TipAmount: String {
    case fifteen = "15%"
    case eighteen = "18%"
    case twenty = "20%"
    case twentyfive = "25%"
}

enum splitBetweenPeople: String {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
}

struct ContentView: View {
    @State var tipAmount = "0"
    @State var splitAmount = "0"
    @State var updatedBillAmount = 0.00
    let buttons: [TipAmount] = [.fifteen, .eighteen, .twenty, .twentyfive]
    let button2: [splitBetweenPeople] = [.two, .three, .four, .five, .six, .seven, .eight, .nine]
    @State private var billAmount: String = ""
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                TextField("Enter bill amount", text: $billAmount)
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .onChange(of: billAmount) { newValue in
                        self.updatedBillAmount = Double(newValue) ?? 0.0
                    }

                Text("Tip is " + "$" + tipAmount)
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                    .padding()
                
                Text("Select the percentage you would like to tip")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                    .padding()
                
                HStack {
                    ForEach(buttons, id: \.self) { item in
                        Button {
                            self.calculateTip(button: item)
                        } label: {
                            Text(item.rawValue)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: self.buttonWidth(), height: self.buttonHeight())
                                .background(.green)
                                .cornerRadius(self.buttonWidth()/2)
                        }
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                }
                
                Text("$" + splitAmount + " per person")
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                    .padding(40)
    
                Text("Select the amount of people to split the tip with")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(button2, id: \.self) { item in
                            Button {
                                self.calculateSplitTip(button: item)
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(width: self.buttonWidth(), height: self.buttonHeight())
                                    .background(.green)
                                    .cornerRadius(self.buttonWidth()/2)
                            }

                        }
                        .padding(.leading, 8)
//                        .padding(.trailing, 8)
                    }.padding()
                }
                
                Spacer()
            } .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
    func calculateTip(button: TipAmount) {
        switch button {
        case .fifteen:
            let calculatedAmount = Double(updatedBillAmount * 0.15).rounded(toPlaces: 2)
            self.tipAmount = "\(calculatedAmount)"
        case .eighteen:
            let calculatedAmount = Double(updatedBillAmount * 0.18).rounded(toPlaces: 2)
            self.tipAmount = "\(calculatedAmount)"
        case .twenty:
            let calculatedAmount = Double(updatedBillAmount * 0.20).rounded(toPlaces: 2)
            self.tipAmount = "\(calculatedAmount)"
        case .twentyfive:
            let calculatedAmount = Double(updatedBillAmount * 0.25).rounded(toPlaces: 2)
            self.tipAmount = "\(calculatedAmount)"
        }
    }
    
    func calculateSplitTip(button: splitBetweenPeople) {
        switch button {
        case .two:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 2).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .three:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 3).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .four:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 4).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .five:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 5).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .six:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 6).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .seven:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 7).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .eight:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 8).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        case .nine:
            let billAmountDouble = Double(tipAmount) ?? 0
            let calculatedAmount = Double(billAmountDouble / 9).rounded(toPlaces: 2)
            self.splitAmount = "\(calculatedAmount)"
        }
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4.5
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4.5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
