//
//  StatisticScreen.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct IncomeDetail: View {
    @EnvironmentObject var t: TransactionManager
    
    var body: some View {
        // Top Filter scrollview
        VStack {
            VStack(alignment: .center){
                Text("Finanace App")
                    .font(.title)
                    .fontWeight(.bold)
                Divider()

            }
            VStack(alignment: .leading) {
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Income detail")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }.padding(.bottom,0)
            //Pie Chart Section
            ZStack(alignment: .center) {
                
                if #available(iOS 17.0, *) {
                    CircularIncomeDetail()
                        .frame(width: 200, height: 200)
                } else {
                    // Fallback on earlier versions
                    Text("support by iOS 17.0")
                }
            }
            VStack {
                EditButton()
                List {
                    ForEach(t.incomes, id: \.id) {
                        income in
                        VStack(alignment: .leading) {
                            HStack(alignment: .top){
                                Text("\(income.date.formatted(.dateTime.month().day().year()))")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom, 0)
                            HStack {
                                Text("Category: ")
                                    .font(.system(size:14))
                                Text(income.category)
                                    .fontWeight(.bold)
                                    .font(.system(size:14))
                            }
                            HStack {
                                Text(income.name)
                                    .fontWeight(.bold)
                                    .font(.system(size:14))
                                Text(income.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .font(.system(size:14))
                                    .fontWeight(.regular)
                                Spacer()
                            }
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .topLeading
                        )
                    }.onDelete {
                        offset in
                        t.incomes.remove(atOffsets: offset)
                    }
                    .onMove {
                        offset, index in
                        t.incomes.move(fromOffsets: offset,
                                       toOffset: index)
                    }
                }
            }
            .padding(.top)
            
            // Button add income
            NavigationLink(destination: AddIncome()) {
                Text("Add income")
                    .bold()
                    .modifier(ButtonDesign())
            }
            Spacer()
        }
    }
}

struct IncomeDetail_Previews: PreviewProvider {
    static var previews: some View {
        IncomeDetail()
    }
}
