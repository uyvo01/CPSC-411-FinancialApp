//
//  StatisticScreen.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct ExpensesDetail: View {
    @EnvironmentObject var transaction: TransactionManager
   
    var body: some View {
        // Top Filter scrollview
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(filters, id: \.self) { item in
                        FilterView(title: item)
                    }
                }
            }
            .frame(height: 50)
            .padding(.bottom, 5)
           
            // Templetes section
           
            VStack(alignment: .leading) {
                    
                HStack(alignment: .firstTextBaseline) {
                    Text("Expense detail")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            
            //Scroll templete
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(transaction.expenses, id: \.id) {
                        expense in
                        VStack {
                            HStack(alignment: .center){
                                Text(expense.date)
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom, 0)
                            
                            HStack {
                                Text(expense.name)
                                    .fontWeight(.bold)
                                    
                                Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 7)
                            .background(Color("OrangePrimary"))
                            .cornerRadius(10)
                            
                        }
                        .padding(5)
                        .background(Color("BlueSecondary"))
                        .cornerRadius(15)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .topLeading
                        )
                    }.frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
            }
            .padding(.leading, 0)
            .frame(maxWidth: .infinity)
            // Button add expense
            NavigationLink(destination: AddExpense()) {
                Text("Add expense")
                    .bold()
                    .modifier(ButtonDesign())
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct ExpensesDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesDetail()
    }
}
