//
//  StatisticScreen.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct ExpensesDetail: View {
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
                    Text("Expenses detail")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }.padding(.bottom,0)
            //Pie Chart Section
            ZStack(alignment: .center) {
                
                if #available(iOS 17.0, *) {
                    CircularExpenseDetail()
                        .frame(width: 200, height: 200)
                } else {
                    // Fallback on earlier versions
                    Text("support by iOS 17.0")
                }
            }
            VStack {
                EditButton()
                    
                List {
                    ForEach(t.expenses, id: \.id) {
                        expense in
                        VStack(alignment: .leading) {
                            HStack(alignment: .top){
                                Text("\(expense.date.formatted(.dateTime.month().day().year()))")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom, 0)
                            
                            HStack {
                                Text("Category: ")
                                    .font(.system(size:14))
                                Text(expense.category)
                                    .fontWeight(.bold)
                                    .font(.system(size:14))
                            }
                            HStack {
                                Text(expense.name)
                                    .fontWeight(.bold)
                                    .font(.system(size:14))
                                Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
                        t.expenses.remove(atOffsets: offset)
                    }
                    .onMove {
                        offset, index in
                        t.expenses.move(fromOffsets: offset,
                                       toOffset: index)
                    }
                }
            }
            .padding(.top)
            
            // Button add income
            NavigationLink(destination: AddExpense()) {
                Text("Add expense")
                    .bold()
                    .modifier(ButtonDesign())
            }
            Spacer()
        }
    }
}

struct ExpensesDetailDetail_Previews: PreviewProvider {
    static var previews: some View {
        IncomeDetail()
    }
}
