//
//  StatisticScreen.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct IncomeDetail: View {
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
                    Text("Income detail")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            
            //Scroll templete
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(transaction.incomes, id: \.id) {
                        income in
                        VStack {
                            HStack(alignment: .center){
                                Text(income.date)
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom, 0)
                            
                            HStack {
                                Text(income.name)
                                    .fontWeight(.bold)
                                
                                Text(income.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                //Text(String(income.amount))
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
            // Button add income
            NavigationLink(destination: AddIncome()) {
                Text("Add income")
                    .bold()
                    .modifier(ButtonDesign())
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct IncomeDetail_Previews: PreviewProvider {
    static var previews: some View {
        IncomeDetail()
    }
}
