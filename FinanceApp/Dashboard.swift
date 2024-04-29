//
//  StatisticScreen.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct Dashboard: View {
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
            
            //Pie Chart Section
            ZStack(alignment: .center) {
                CircularProgressView()
                    .frame(width: 200, height: 200)
                //Middle Text
                
                VStack{
                    Text("Income")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(transaction.incomes.map{$0.amount}.reduce(0, +), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //Text(String(transaction.incomes.map{$0.amount}.reduce(0, +)))
                        .fontWeight(.bold)
                }
            }
            .padding(.bottom)
            
            VStack{
                Text(transaction.expenses.map{$0.amount}.reduce(0, +), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                //Text(String(transaction.expenses.map{$0.amount}.reduce(0, +)))
                    .fontWeight(.bold)
                Text("Expenses")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
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
                        .padding(.leading, 5)
                }
                
                //Scroll templete
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(transaction.incomes, id: \.id) {income in
                            VStack {
                                
                                VStack(alignment: .leading){
                                    Text(income.name)
                                        .fontWeight(.bold)
                                    Text(income.date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.bottom, 5)
                                
                                HStack {
                                    Text("Paid")
                                        .font(.callout)
                                        .padding(.trailing, 10)
                                    Text(income.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    //Text(String(income.amount))
                                        .fontWeight(.bold)
                                }
                                .padding(.vertical, 5)
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
                .frame(height: 150)
                //Scroll templete
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(transaction.expenses, id: \.id) {expense in
                            VStack {
                                
                                VStack(alignment: .leading){
                                    Text(expense.name)
                                        .fontWeight(.bold)
                                    Text(expense.date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.bottom, 5)
                                
                                HStack {
                                    Text("Paid")
                                        .font(.callout)
                                        .padding(.trailing, 10)
                                    Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .fontWeight(.bold)
                                }
                                .padding(.vertical, 5)
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
                .frame(height: 150)
            }
            .padding(.leading, 5)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
