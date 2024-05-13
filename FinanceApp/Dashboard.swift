//
//  StatisticScreen.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct Dashboard: View {
    @EnvironmentObject var transaction: TransactionManager
    
    var body: some View {
        
        
        VStack {
            VStack(alignment: .center){
                Text("Finanace App")
                    .font(.title)
                    .fontWeight(.bold)
                Divider()

            }
           /*
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(filters, id: \.self) { item in
                        FilterView(title: item)
                    }
                }
            }
            .frame(height: 50)
            .padding(.bottom, 5)
            */
            VStack{
                Text("Expenses")
                Text(transaction.expenses.map{$0.amount}.reduce(0, +), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                //Text(String(transaction.incomes.map{$0.amount}.reduce(0, +)))
                    .fontWeight(.bold)
            }
            //Pie Chart Section
            ZStack(alignment: .center) {
                
                CircularProgressView()
                    .frame(width: 200, height: 200)
                //Middle Text
                VStack{
                    Text("Incomes")
                    Text(transaction.incomes.map{$0.amount}.reduce(0, +), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //Text(String(transaction.incomes.map{$0.amount}.reduce(0, +)))
                        .fontWeight(.bold)
                }

            }
            /*
            HStack{
                Text(transaction.expenses.map{$0.amount}.reduce(0, +), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                //Text(String(transaction.expenses.map{$0.amount}.reduce(0, +)))
                    .fontWeight(.bold)
                Text("Expenses")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            */
            Spacer()
            
            // Templetes section
            VStack(alignment: .leading) {
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Transactions")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("recently added")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        
                }
                
                //Scroll templete
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(transaction.incomes, id: \.id) {income in
                            VStack {
                                
                                VStack(alignment: .leading){
                                    Text(income.name)
                                        .fontWeight(.bold)
                                    Text("\(income.date.formatted(.dateTime.month().day().year()))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.bottom, 0)
                                
                                HStack {
                                    Text("Paid")
                                        .font(.callout)
                                        .padding(.trailing, 0)
                                    Text(income.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    //Text(String(income.amount))
                                        .fontWeight(.bold)
                                }
                                .padding(.vertical, 0)
                                .padding(.horizontal, 7)
                                .background(Color("OrangePrimary"))
                                .cornerRadius(10)
                                
                            }
                            .padding()
                            .background(Color("BlueSecondary"))
                            .cornerRadius(15)
                        }
                    }
                }
                
                //Scroll templete
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(transaction.expenses, id: \.id) {expense in
                            VStack {
                                
                                VStack(alignment: .leading){
                                    Text(expense.name)
                                        .fontWeight(.bold)
                                    Text("\(expense.date.formatted(.dateTime.month().day().year()))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.bottom, 0)
                                
                                HStack {
                                    Text("Paid")
                                        .font(.callout)
                                        .padding(.trailing, 0)
                                    Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .fontWeight(.bold)
                                }
                                .padding(.vertical, 0)
                                .padding(.horizontal, 7)
                                .background(Color("OrangePrimary"))
                                .cornerRadius(10)
                                
                            }
                            .padding()
                            .background(Color("BlueSecondary"))
                            .cornerRadius(15)
                        }
                    }
                }
            }
            .padding(.leading, 5)
        }
        
    }
}
